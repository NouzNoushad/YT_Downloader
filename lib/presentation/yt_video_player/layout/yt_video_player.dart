import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:yt_downloader/data/bloc/yt_video_player/yt_video_player_bloc.dart';
import 'package:yt_downloader/presentation/widgets/yt_app_bar.dart';
import 'package:yt_downloader/utils/colors.dart';

class YtVideoPlayerScreen extends StatefulWidget {
  final String youtubeId;
  const YtVideoPlayerScreen({super.key, required this.youtubeId});

  @override
  State<YtVideoPlayerScreen> createState() => _YtVideoPlayerScreenState();
}

class _YtVideoPlayerScreenState extends State<YtVideoPlayerScreen> {
  @override
  void initState() {
    context.read<YtVideoPlayerBloc>().add(YtVideoPlayerLoadedEvent(widget.youtubeId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.colorScheme2,
      appBar: ytAppBar,
      body: BlocBuilder<YtVideoPlayerBloc, YtVideoPlayerState>(
        builder: (context, state) {
          if (state is YtVideoPlayerLoadedState) {
            if (state.youtubePlayerController != null) {
              return Column(children: [
                YoutubePlayer(
                  controller: state.youtubePlayerController!,
                  showVideoProgressIndicator: true,
                  // bottomActions: [
                  //   ProgressBar(
                  //     isExpanded: true,
                  //     colors: ProgressBarColors(
                  //       playedColor: whiteColor,
                  //       handleColor: whiteColor,
                  //     ),
                  //   ),
                  //   CurrentPosition(),
                  //   PlaybackSpeedButton(),
                  // ],
                  onEnded: (end) {
                    state.youtubePlayerController
                        ?.seekTo(const Duration(seconds: 0));
                  },
                )
                // downloader
              ]);
            }
          }
          return const Center(
            child: CircularProgressIndicator(
                backgroundColor: ColorPicker.colorScheme4),
          );
        },
      ),
    );
  }
}
