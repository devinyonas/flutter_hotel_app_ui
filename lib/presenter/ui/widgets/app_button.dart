import 'package:flutter/material.dart';
import 'package:flutter_hotel_app_ui/gen/colors.gen.dart';
import 'package:flutter_hotel_app_ui/utilities/app_text.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  const AppButton({required this.buttonText, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        backgroundColor: MaterialStateProperty.all(ColorName.yellow),
        minimumSize: MaterialStateProperty.all(const Size(200, 50)),
        elevation: MaterialStateProperty.all(0),
      ),
      child: AppText.medium(
        buttonText,
        fontSize: 16,
      ),
    );
  }
}
