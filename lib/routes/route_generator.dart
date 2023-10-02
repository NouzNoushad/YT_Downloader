import 'package:flutter/material.dart';
import 'package:yt_downloader/presentation/yt_home/layout/yt_home.dart';
import 'package:yt_downloader/presentation/yt_video_player/layout/yt_video_player.dart';
import 'package:yt_downloader/routes/route_constant.dart';
import 'package:yt_downloader/utils/colors.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.home:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.home),
            builder: (context) => const YTHomeScreen());
      case RouteConstant.video:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.video),
            builder: (context) => YtVideoPlayerScreen(
              youtubeId: settings.arguments as String,
            ));
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  backgroundColor: ColorPicker.colorScheme1,
                  body: Center(
                    child: Text(
                      "Page Not Found",
                      style: TextStyle(
                          color: ColorPicker.colorScheme4,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                ));
    }
  }
}
