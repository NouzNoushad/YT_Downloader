import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:yt_downloader/data/bloc/yt_video/yt_video_bloc.dart';
import 'package:yt_downloader/data/bloc/yt_video_player/yt_video_player_bloc.dart';
import 'package:yt_downloader/presentation/yt_video_player/components/download_info.dart';
import 'package:yt_downloader/utils/colors.dart';

import '../../widgets/yt_app_bar.dart';

class YtVideoPlayerScreen extends StatefulWidget {
  final String youtubeId;
  const YtVideoPlayerScreen({super.key, required this.youtubeId});

  @override
  State<YtVideoPlayerScreen> createState() => _YtVideoPlayerScreenState();
}

class _YtVideoPlayerScreenState extends State<YtVideoPlayerScreen> {
  @override
  void initState() {
    context
        .read<YtVideoPlayerBloc>()
        .add(YtVideoPlayerLoadedEvent(widget.youtubeId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.colorScheme2,
      appBar: ytAppBar(true),
      body: BlocBuilder<YtVideoBloc, YtVideoState>(
        builder: (context, ytState) {
          if (ytState is YtVideoLoading) {
            return const Center(
              child: CircularProgressIndicator(
                  backgroundColor: ColorPicker.colorScheme4),
            );
          }
          if (ytState is YtVideoLoadedState) {
            if (ytState.videoResponse != null) {
              return BlocBuilder<YtVideoPlayerBloc, YtVideoPlayerState>(
                builder: (context, videoState) {
                  if (videoState is YtVideoPlayerLoadedState) {
                    if (videoState.youtubePlayerController != null) {
                      return Column(children: [
                        YoutubePlayer(
                          controller: videoState.youtubePlayerController!,
                          // showVideoProgressIndicator: true,
                          bottomActions: [
                            ProgressBar(
                              isExpanded: true,
                              colors: const ProgressBarColors(
                                playedColor: ColorPicker.colorScheme4,
                                handleColor: ColorPicker.colorScheme4,
                              ),
                            ),
                            CurrentPosition(),
                            const PlaybackSpeedButton(),
                          ],
                          onEnded: (end) {
                            videoState.youtubePlayerController
                                ?.seekTo(const Duration(seconds: 0));
                          },
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        DownloadInfo(videoResponse: ytState.videoResponse!),
                      ]);
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                        backgroundColor: ColorPicker.colorScheme4),
                  );
                },
              );
            }
            return const Center(
              child: Text('No Record Found'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
