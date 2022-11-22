import 'package:flutter_hotel_app_ui/domain/model/hotel_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hotel_data_controller.g.dart';

@riverpod
HotelModel selectedHotel(SelectedHotelRef ref) {
  final hotelController = ref.watch(hotelDataControllerProvider);
  return hotelController.selectedHotel;
}

@riverpod
HotelDataController hotelDataController(HotelDataControllerRef ref) {
  return HotelDataController();
}

class HotelDataController {
  HotelModel? _selectedHotel;

  HotelModel get selectedHotel => _selectedHotel ?? listHotel.first;

  List<HotelModel> get listHotel => const [
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
            coordinate: LatLng(-7.841023190103352, 110.33735593910913),
            price: 458),
        HotelModel(
            imagePath: 'assets/image/thumbnail2.png',
            title: 'Alana Hotel',
            location: 'Bantul Regency, Yogyakarta',
            ratingScore: 10,
            coordinate: LatLng(-7.8147871933139434, 110.36921653947174),
            price: 338),
      ];

  void setSelectedHotel(HotelModel hotelModel) => _selectedHotel = hotelModel;
}
