import 'package:flutter/material.dart';
import 'package:flutter_hotel_app_ui/domain/model/hotel_model.dart';
import 'package:flutter_hotel_app_ui/gen/assets.gen.dart';
import 'package:flutter_hotel_app_ui/gen/colors.gen.dart';
import 'package:flutter_hotel_app_ui/presenter/ui/widgets/rating_widget.dart';
import 'package:flutter_hotel_app_ui/utilities/app_text.dart';
import 'package:flutter_hotel_app_ui/utilities/constanst.dart';

class HotelCardWidget extends StatelessWidget {
  final HotelModel hotelModel;
  const HotelCardWidget({
    required this.hotelModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius = 16.0;
    return GestureDetector(
      onTap: () {
        // (TODO) Goto detail
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                ),
                child: Image.asset(
                  hotelModel.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.large(
                      hotelModel.title,
                      fontSize: 18,
                      textAlign: TextAlign.left,
                      maxLine: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Assets.icon.location
                            .svg(color: ColorName.darkGrey, height: 15),
                        const SizedBox(width: 8),
                        AppText.small(hotelModel.location),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: RatingWidget(ratingScore: hotelModel.ratingScore),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          AppTextSpan.large(hotelModel.price.moneyFormat()),
                          AppTextSpan.medium(' /night')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
