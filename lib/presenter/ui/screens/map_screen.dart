import 'package:flutter/material.dart';
import 'package:flutter_hotel_app_ui/presenter/controller/hotel_data_controller.dart';
import 'package:flutter_hotel_app_ui/presenter/controller/location_controller.dart';
import 'package:flutter_hotel_app_ui/presenter/ui/widgets/hotel_card_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widget_marker_google_map/widget_marker_google_map.dart';

class MapScreen extends HookConsumerWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationController = ref.watch(locationControllerProvider);
    final hotelController = ref.watch(hotelDataControllerProvider);
    return Scaffold(
      body: locationController.when(
          data: (controller) => Stack(
                children: [
                  WidgetMarkerGoogleMap(
                    onMapCreated: controller.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: controller.defaultLocation,
                      zoom: 12.0,
                    ),
                    widgetMarkers: controller.markers,
                    zoomControlsEnabled: false,
                  ),
                  hotelController.maybeWhen(
                      data: (hotel) => Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: HotelCardWidget(
                                hotelModel: hotel,
                              ),
                            ),
                          ),
                      orElse: () => const SizedBox.shrink())
                ],
              ),
          error: (e, s) => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
