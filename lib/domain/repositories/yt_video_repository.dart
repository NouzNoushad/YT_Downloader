import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:yt_downloader/data/repositories/yt_video_abstract.dart';

class YtVideoRepository extends YtVideoRepositoryModel {
  YoutubePlayerController? youtubeController;

  @override
  YoutubePlayerController? initializeYoutubeVideo(String youtubeId) {
    youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(youtubeId).toString(),
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        loop: false,
        disableDragSeek: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    );
    return youtubeController;
  }
}
