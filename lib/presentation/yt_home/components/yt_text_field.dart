import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';

class YtTextField extends StatelessWidget {
  final TextEditingController controller;
  const YtTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        maxLines: null,
        cursorColor: ColorPicker.colorScheme5,
        style: const TextStyle(
            color: ColorPicker.colorScheme5, decorationThickness: 0),
        decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.search,
              color: ColorPicker.colorScheme4,
            ),
            hintText: 'Paste Video Link',
            hintStyle: const TextStyle(
              color: ColorPicker.colorScheme4,
            ),
            enabledBorder: kInputBorder,
            focusedBorder: kInputBorder));
  }
}
