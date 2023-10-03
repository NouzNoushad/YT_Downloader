import 'package:flutter/material.dart';
import 'package:yt_downloader/utils/colors.dart';

enum DownloadStatus { success, failed, error }

OutlineInputBorder kInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(width: 2, color: ColorPicker.colorScheme4));

OutlineInputBorder kErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(width: 2, color: ColorPicker.colorScheme4));