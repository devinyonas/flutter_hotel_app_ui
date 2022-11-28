import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:widget_marker_google_map/widget_marker_google_map.dart';

import '../../controller/hotel_data_controller.dart';
import '../../controller/location_controller.dart';
import '../widgets/hotel_card_widget.dart';

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
                  GoogleMap(
                    onMapCreated: controller.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: controller.defaultLocation,
                      zoom: 12.0,
                    ),
                    markers: controller.markers,
                    // widgetMarkers: controller.markers,
                  ),
                  // WidgetMarkerGoogleMap(
                  //   onMapCreated: controller.onMapCreated,
                  //   initialCameraPosition: CameraPosition(
                  //     target: controller.defaultLocation,
                  //     zoom: 12.0,
                  //   ),
                  //   widgetMarkers: controller.markers,
                  //   zoomControlsEnabled: false,
                  // ),
                  // hotelController.maybeWhen(
                  //     data: (hotel) => Align(
                  //           alignment: Alignment.bottomCenter,
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(16),
                  //             child: HotelCardWidget(
                  //               hotelModel: hotel,
                  //             ),
                  //           ),
                  //         ),
                  //     orElse: () => const SizedBox.shrink())
                ],
              ),
          error: (e, s) => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
