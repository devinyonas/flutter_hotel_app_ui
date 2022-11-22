import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_hotel_app_ui/presenter/controller/hotel_data_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_controller.g.dart';

@riverpod
LocationController locationControllerProvider(
    LocationControllerProviderRef ref) {
  final hotelController = ref.watch(hotelDataControllerProvider);
  final locationController = LocationController();
  final markers = hotelController.listHotel
      .map((hotel) => Marker(
            markerId: MarkerId(hotel.coordinate.toString()),
            position: hotel.coordinate,
            onTap: () async {
              hotelController.setSelectedHotel(hotel);
              await locationController.setNewLocation(
                  hotel.coordinate.latitude, hotel.coordinate.longitude);
            },
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
  late final LatLng _currentLocation;
  final Set<Marker> _markers = {};

  LatLng get currentLocation => _currentLocation;
  Set<Marker> get markers => _markers;

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

  void setMarker({required Set<Marker> markers}) {
    _markers.addAll(markers);
  }
}
