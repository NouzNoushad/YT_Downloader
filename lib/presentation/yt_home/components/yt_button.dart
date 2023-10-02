import 'package:flutter/material.dart';
import 'package:yt_downloader/utils/colors.dart';

class YtButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final void Function()? onPressed;
  const YtButton(
      {super.key,
      required this.text,
      required this.buttonColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          text,
          style: const TextStyle(color: ColorPicker.colorScheme1),
        ));
  }
}
