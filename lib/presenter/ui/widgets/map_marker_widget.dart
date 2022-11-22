import 'package:flutter/material.dart';
import 'package:flutter_hotel_app_ui/gen/colors.gen.dart';
import 'package:flutter_hotel_app_ui/utilities/app_text.dart';

class MapMarker extends StatelessWidget {
  final String price;
  const MapMarker(this.price, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: key,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        decoration: BoxDecoration(
            color: ColorName.primaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: AppText.medium(
          price,
          color: Colors.white,
        ),
      ),
    );
  }
}
