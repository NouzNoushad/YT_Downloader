part of 'yt_video_player_bloc.dart';

sealed class YtVideoPlayerState extends Equatable {
  const YtVideoPlayerState();

  @override
  List<Object?> get props => [];
}

final class YtVideoPlayerInitial extends YtVideoPlayerState {}

class YtVideoPlayerLoadedState extends YtVideoPlayerState {
  final YoutubePlayerController? youtubePlayerController;
  const YtVideoPlayerLoadedState(this.youtubePlayerController);

  @override
  List<Object?> get props => [youtubePlayerController];
}

class YtVideoPlayerErrorState extends YtVideoPlayerState {
  final String error;
  const YtVideoPlayerErrorState(this.error);

  @override
  List<Object> get props => [error];
}
