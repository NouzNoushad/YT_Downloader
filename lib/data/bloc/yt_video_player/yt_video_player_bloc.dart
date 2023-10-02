import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:yt_downloader/domain/repositories/yt_video_repository.dart';

part 'yt_video_player_event.dart';
part 'yt_video_player_state.dart';

class YtVideoPlayerBloc extends Bloc<YtVideoPlayerEvent, YtVideoPlayerState> {
  final YtVideoRepository ytVideoRepository;
  YtVideoPlayerBloc({
    required this.ytVideoRepository,
  }) : super(YtVideoPlayerInitial()) {
    on<YtVideoPlayerLoadedEvent>(initializeYoutubeVideoPlayer);
  }

  FutureOr<void> initializeYoutubeVideoPlayer(
      YtVideoPlayerLoadedEvent event, Emitter<YtVideoPlayerState> emit) {
    try {
      YoutubePlayerController? youtubePlayerController =
          ytVideoRepository.initializeYoutubeVideo(event.youtubeId);
      emit(YtVideoPlayerLoadedState(youtubePlayerController));
    } catch (error) {
      emit(YtVideoPlayerErrorState(error.toString()));
    }
  }
}
