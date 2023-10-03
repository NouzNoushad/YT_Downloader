import 'package:flutter/material.dart';
import '../../utils/colors.dart';

PreferredSizeWidget ytAppBar(bool leading) => AppBar(
      backgroundColor: ColorPicker.colorScheme1,
      automaticallyImplyLeading: leading,
      title: const Text(
        'YT Downloader',
        style: TextStyle(
          color: ColorPicker.colorScheme4,
        ),
      ),
    );