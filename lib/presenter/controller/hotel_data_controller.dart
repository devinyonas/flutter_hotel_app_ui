import 'package:flutter_hotel_app_ui/domain/model/hotel_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hotel_data_controller.g.dart';

@riverpod
HotelDataController hotelDataController(HotelDataControllerRef ref) {
  return HotelDataController();
}

class HotelDataController {
  List<HotelModel> get listHotel => const [
        HotelModel(
            imagePath: 'assets/image/thumbnail1.png',
            title: 'D`Omah Hotel Yogya',
            location: 'Bantul Regency, Yogyakarta',
            ratingScore: 4.25,
            price: 458),
        HotelModel(
            imagePath: 'assets/image/thumbnail2.png',
            title: 'Greenhost Boutique Hotel',
            location: 'Bantul Regency, Yogyakarta',
            ratingScore: 3.6,
            price: 338),
        HotelModel(
            imagePath: 'assets/image/thumbnail1.png',
            title: 'D`Omah Hotel Yogya',
            location: 'Bantul Regency, Yogyakarta',
            ratingScore: 2.6,
            price: 458),
        HotelModel(
            imagePath: 'assets/image/thumbnail2.png',
            title: 'Greenhost Boutique Hotel',
            location: 'Bantul Regency, Yogyakarta',
            ratingScore: 10,
            price: 338),
      ];
}
