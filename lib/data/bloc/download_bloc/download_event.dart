part of 'download_bloc.dart';

sealed class DownloadEvent extends Equatable {
  const DownloadEvent();

  @override
  List<Object> get props => [];
}

class DownloadLoadedEvent extends DownloadEvent {
  final String url;
  final String fileName;
  const DownloadLoadedEvent(this.url, this.fileName);

  @override
  List<Object> get props => [url, fileName];
}
