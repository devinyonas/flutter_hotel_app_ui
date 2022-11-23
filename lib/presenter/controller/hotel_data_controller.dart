import 'package:flutter_hotel_app_ui/domain/model/hotel_model.dart';
import 'package:flutter_hotel_app_ui/domain/repository/hotel_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hotel_data_controller.g.dart';

@riverpod
class HotelDataController extends _$HotelDataController {
  @override
  Future<HotelModel> build() async {
    final hotelRepo = ref.watch(hotelRepositoryProvider);
    return (await hotelRepo.getHotelList()).first;
  }

  void setSelectedHotel(HotelModel hotelModel) =>
      state = AsyncValue.data(hotelModel);
}
