import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yt_downloader/data/bloc/yt_video/yt_video_bloc.dart';
import 'package:yt_downloader/presentation/widgets/yt_app_bar.dart';
import 'package:yt_downloader/presentation/yt_home/components/yt_button.dart';
import 'package:yt_downloader/presentation/yt_home/components/yt_text_field.dart';
import 'package:yt_downloader/routes/route_constant.dart';
import 'package:yt_downloader/utils/colors.dart';

class YTHomeScreen extends StatefulWidget {
  const YTHomeScreen({super.key});

  @override
  State<YTHomeScreen> createState() => _YTHomeScreenState();
}

class _YTHomeScreenState extends State<YTHomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPicker.colorScheme2,
      appBar: ytAppBar,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: size.width,
          child: Card(
              color: ColorPicker.colorScheme1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    YtTextField(
                      controller: searchController,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: YtButton(
                          text: "Cancel",
                          buttonColor: ColorPicker.colorScheme3,
                          onPressed: () {
                            searchController.text = "";
                          },
                        )),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                            child: YtButton(
                          text: "Search",
                          buttonColor: ColorPicker.colorScheme4,
                          onPressed: () {
                            String youtubeId = searchController.text.trim();
                            context
                                .read<YtVideoBloc>()
                                .add(YtVideoLoadedEvent(youtubeId));
                            Navigator.of(context)
                                .pushNamed(RouteConstant.video, arguments: youtubeId);
                          },
                        )),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
