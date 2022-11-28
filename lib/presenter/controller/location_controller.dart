import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repository/hotel_repository.dart';
import 'hotel_data_controller.dart';

part 'location_controller.g.dart';

@riverpod
Future<LocationController> locationController(LocationControllerRef ref) async {
  final hotelControllerNotifier =
      ref.watch(hotelDataControllerProvider.notifier);
  final hotelRepo = ref.watch(hotelRepositoryProvider);
  final locationController = LocationController();

  Set<Marker> markers = (await hotelRepo.getHotelList())
      .map(
        (hotel) => Marker(
          markerId: MarkerId(hotel.coordinate.toString()),
          position: hotel.coordinate,
          onTap: () async {
            hotelControllerNotifier.setSelectedHotel(hotel);
            await locationController.setNewLocation(
                hotel.coordinate.latitude, hotel.coordinate.longitude);
          },
        ),
      )
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
  final Set<Marker> _markers = {};

  LatLng get currentLocation => _currentLocation;
  Set<Marker> get markers => _markers;

  void onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  Future<void> setNewLocation(double lat, double lng) async {
    _currentLocation = LatLng(lat, lng);
    CameraPosition cameraPos = CameraPosition(
      target: _currentLocation,
      zoom: 15,
    );
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPos));
  }

  void setMarker({required Set<Marker> markers}) {
    _markers.addAll(markers);
  }

  void setIcon(ui.Image image) {}

  static Future<BitmapDescriptor> widgetToIcon(ui.Image image) async {
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }

  static Future<BitmapDescriptor> markerFromIcon(
    IconData icon,
    Color color,
    double size,
  ) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          letterSpacing: 0.0,
          fontSize: size,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          color: color,
        ));
    textPainter.layout();
    textPainter.paint(canvas, Offset.zero);

    final picture = pictureRecorder.endRecording();
    final image = await picture.toImage(size.round(), size.round());
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }
}
