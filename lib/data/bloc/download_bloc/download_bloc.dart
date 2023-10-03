import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yt_downloader/domain/repositories/yt_download.dart';

import '../../../utils/constant.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final YtDownloadRepository ytDownloadRepository;
  DownloadBloc({
    required this.ytDownloadRepository,
  }) : super(DownloadInitial()) {
    on<DownloadLoadedEvent>(initializeDownload);
  }

  FutureOr<void> initializeDownload(
      DownloadLoadedEvent event, Emitter<DownloadState> emit) async {
    try {
      await ytDownloadRepository.initializeDownload(event.url, event.fileName);
      double progress = ytDownloadRepository.progress;
      DownloadStatus downloadState = ytDownloadRepository.downloadStatus;
      emit(DownloadLoadedState(progress, downloadState));
    } catch (error) {
      emit(DownloadErrorState(error.toString()));
    }
  }
}
