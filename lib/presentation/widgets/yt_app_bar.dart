import 'package:flutter/material.dart';
import '../../utils/colors.dart';

PreferredSizeWidget ytAppBar = AppBar(
      backgroundColor: ColorPicker.colorScheme1,
      automaticallyImplyLeading: false,
      title: const Text(
        'YT Downloader',
        style: TextStyle(
          color: ColorPicker.colorScheme4,
        ),
      ),
    );