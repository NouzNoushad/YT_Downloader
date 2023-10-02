part of 'yt_video_player_bloc.dart';

sealed class YtVideoPlayerEvent extends Equatable {
  const YtVideoPlayerEvent();

  @override
  List<Object> get props => [];
}

class YtVideoPlayerLoadedEvent extends YtVideoPlayerEvent {
  final String youtubeId;
  const YtVideoPlayerLoadedEvent(this.youtubeId);

  @override
  List<Object> get props => [youtubeId];
}
