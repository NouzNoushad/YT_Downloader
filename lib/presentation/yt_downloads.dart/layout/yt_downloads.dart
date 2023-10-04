import 'package:flutter/material.dart';
import 'package:yt_downloader/presentation/widgets/yt_app_bar.dart';
import 'package:yt_downloader/presentation/yt_downloads.dart/components/download_item.dart';
import 'package:yt_downloader/utils/colors.dart';

class YtDownloadScreen extends StatelessWidget {
  const YtDownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.colorScheme2,
      appBar: ytAppBar(false),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
          DownloadItem(),
          DownloadItem(),
        ]),
      ),
    );
  }
}
