part of 'yt_video_bloc.dart';

sealed class YtVideoState extends Equatable {
  const YtVideoState();

  @override
  List<Object?> get props => [];
}

final class YtVideoInitial extends YtVideoState {}

final class YtVideoLoading extends YtVideoState {}

class YtVideoLoadedState extends YtVideoState {
  final Response? videoResponse;
  const YtVideoLoadedState(this.videoResponse);

  @override
  List<Object?> get props => [videoResponse];
}

class YtVideoErrorState extends YtVideoState {
  final String error;
  const YtVideoErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
