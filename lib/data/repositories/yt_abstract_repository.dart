import 'package:yt_downloader/domain/models/yt_video_response.dart';

abstract class YtRepositoryModel {
  Future<Response?> getYoutubeDetails(String youtubeId);
}
