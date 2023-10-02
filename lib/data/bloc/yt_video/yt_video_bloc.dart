import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yt_downloader/domain/models/yt_video_response.dart';
import 'package:yt_downloader/domain/repositories/yt_repository.dart';

part 'yt_video_event.dart';
part 'yt_video_state.dart';

class YtVideoBloc extends Bloc<YtVideoEvent, YtVideoState> {
  final YtRepository ytRepository;
  YtVideoBloc({
    required this.ytRepository,
  }) : super(YtVideoInitial()) {
    on<YtVideoLoadedEvent>(getYoutubeVideoDetails);
  }

  FutureOr<void> getYoutubeVideoDetails(
      YtVideoLoadedEvent event, Emitter<YtVideoState> emit) async {
    emit(YtVideoLoading());
    try {
      Response? videoResponse = await ytRepository.getYoutubeDetails(event.youtubeId);
      emit(YtVideoLoadedState(videoResponse));
    } catch (error) {
      emit(YtVideoErrorState(error.toString()));
    }
  }
}
