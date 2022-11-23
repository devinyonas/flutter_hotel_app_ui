import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_hotel_app_ui/domain/repository/hotel_repository.dart';
import 'package:flutter_hotel_app_ui/presenter/controller/hotel_data_controller.dart';
import 'package:flutter_hotel_app_ui/presenter/ui/widgets/map_marker_widget.dart';
import 'package:flutter_hotel_app_ui/utilities/constanst.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widget_marker_google_map/widget_marker_google_map.dart';

part 'location_controller.g.dart';

@riverpod
Future<LocationController> locationController(LocationControllerRef ref) async {
  final hotelControllerNotifier =
      ref.watch(hotelDataControllerProvider.notifier);
  final hotelRepo = ref.watch(hotelRepositoryProvider);
  final locationController = LocationController();

  final markers = (await hotelRepo.getHotelList())
      .map((hotel) => WidgetMarker(
            markerId: hotel.coordinate.toString(),
            position: hotel.coordinate,
            onTap: () async {
              hotelControllerNotifier.setSelectedHotel(hotel);
              await locationController.setNewLocation(
                  hotel.coordinate.latitude, hotel.coordinate.longitude);
            },
            widget: MapMarker(hotel.price.toUSD()),
          ))
      .toSet();
  locationController.setMarker(markers: markers);
  return locationController;
}

class LocationController {
  // default to YOGYAKARTA
  final defaultLocation = const LatLng(-7.795529617707741, 110.36872726427349);
  final globalMarkerKey = GlobalKey();
  final Completer<GoogleMapController> _mapController = Completer();
  LatLng _currentLocation = const LatLng(0, 0);
  final Set<WidgetMarker> _markers = {};

  LatLng get currentLocation => _currentLocation;
  List<WidgetMarker> get markers => _markers.toList(growable: false);

  void onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  Future<void> setNewLocation(double lat, double lng) async {
    _currentLocation = LatLng(lat, lng);
    CameraPosition cameraPos =
        CameraPosition(target: _currentLocation, zoom: 15);
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPos));
  }

  void setMarker({required Set<WidgetMarker> markers}) {
    _markers.addAll(markers);
  }
}
