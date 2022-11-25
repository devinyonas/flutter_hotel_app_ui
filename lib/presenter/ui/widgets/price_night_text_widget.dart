import 'package:flutter/material.dart';
import 'package:flutter_hotel_app_ui/utilities/app_text.dart';
import 'package:flutter_hotel_app_ui/utilities/constanst.dart';

class PricePerNightTextWidget extends StatelessWidget {
  final double price;
  const PricePerNightTextWidget(this.price, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          AppTextSpan.large(price.moneyFormat()),
          AppTextSpan.medium(' /night'),
        ],
      ),
    );
  }
}
