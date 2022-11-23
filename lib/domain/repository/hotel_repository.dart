import 'package:flutter_hotel_app_ui/domain/model/hotel_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hotel_repository.g.dart';

@riverpod
HotelRepository hotelRepository(HotelRepositoryRef ref) => HotelRepository();

class HotelRepository {
  Future<List<HotelModel>> getHotelList() async {
    // Changes data from API here
    return mockListHotel;
  }
}

List<HotelModel> get mockListHotel => const [
      HotelModel(
          imagePath: 'assets/image/thumbnail1.png',
          title: 'D`Omah Hotel Yogya',
          location: 'Bantul Regency, Yogyakarta',
          ratingScore: 4.25,
          coordinate: LatLng(-7.8712168283326625, 110.353484068852),
          price: 458),
      HotelModel(
          imagePath: 'assets/image/thumbnail2.png',
          title: 'Greenhost Boutique Hotel',
          location: 'Bantul Regency, Yogyakarta',
          ratingScore: 3.6,
          coordinate: LatLng(-7.8188302371260265, 110.36928495262913),
          price: 338),
      HotelModel(
          imagePath: 'assets/image/thumbnail1.png',
          title: 'Candi Tirta Raharjo',
          location: 'Bantul Regency, Yogyakarta',
          ratingScore: 2.6,
          coordinate: LatLng(-7.842320836894338, 110.33722565674677),
          price: 698),
      HotelModel(
          imagePath: 'assets/image/thumbnail2.png',
          title: 'Alana Hotel',
          location: 'Bantul Regency, Yogyakarta',
          ratingScore: 10,
          coordinate: LatLng(-7.8147871933139434, 110.36921653947174),
          price: 123),
    ];
