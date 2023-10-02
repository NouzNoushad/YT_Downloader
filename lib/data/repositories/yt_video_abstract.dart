import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class YtVideoRepositoryModel {
  YoutubePlayerController? initializeYoutubeVideo(String youtubeId);
}
