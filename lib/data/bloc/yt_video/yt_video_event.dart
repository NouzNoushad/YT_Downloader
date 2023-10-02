part of 'yt_video_bloc.dart';

sealed class YtVideoEvent extends Equatable {
  const YtVideoEvent();

  @override
  List<Object> get props => [];
}

class YtVideoLoadedEvent extends YtVideoEvent {
  final String youtubeId;
  const YtVideoLoadedEvent(this.youtubeId);

  @override
  List<Object> get props => [youtubeId];
}
