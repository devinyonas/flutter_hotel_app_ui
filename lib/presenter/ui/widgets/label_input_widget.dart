import 'package:flutter/material.dart';
import 'package:flutter_hotel_app_ui/utilities/app_text.dart';

class LabelInputTextWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const LabelInputTextWidget(
      {required this.label, required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: AppText.small(label, fontSize: 14),
        border: InputBorder.none,
        // contentPadding: EdgeInsets.zero,
      ),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
