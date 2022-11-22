import 'package:google_maps_flutter/google_maps_flutter.dart';

class HotelModel {
  final String imagePath;
  final String title;
  final String location;
  final double ratingScore;
  final double price;
  final LatLng coordinate;

  const HotelModel({
    required this.imagePath,
    required this.title,
    required this.location,
    this.ratingScore = 0,
    required this.price,
    required this.coordinate,
  });
}
