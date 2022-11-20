import 'package:flutter/material.dart';
import 'package:flutter_hotel_app_ui/gen/colors.gen.dart';
import 'package:flutter_hotel_app_ui/utilities/app_text.dart';

class RatingWidget extends StatelessWidget {
  final double ratingScore;
  final bool showReviews;
  const RatingWidget(
      {required this.ratingScore, this.showReviews = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 15.0;
    return Row(
      children: [
        for (int i = 1; i <= 5; i++)
          Container(
            margin: const EdgeInsets.all(1),
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: i <= ratingScore ? ColorName.yellow : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: ColorName.yellow, width: 2),
            ),
          ),
        const SizedBox(width: 12),
        AppText.medium('$ratingScore', fontWeight: FontWeight.bold)
      ],
    );
  }
}
