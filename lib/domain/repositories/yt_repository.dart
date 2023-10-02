import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:yt_downloader/data/network/base_client.dart';
import 'package:yt_downloader/data/repositories/yt_abstract_repository.dart';
import 'package:yt_downloader/domain/models/yt_video_response.dart';
import 'package:yt_downloader/utils/end_points.dart';

class YtRepository extends YtRepositoryModel {
  BaseClient baseClient = BaseClient();
  @override
  Future<Response?> getYoutubeDetails(String youtubeId) async {
    try {
      String url = "$baseUrl/${Endpoints.youtube}$youtubeId";
      String? response = await baseClient.getRequest(url);
      if (response != null) {
        Response? videoResponse =
            VideoResponseModel.fromJson(jsonDecode(response)).response;
        debugPrint(
            '/////////////// ============> Response: ${videoResponse?.title}');
        return videoResponse;
      }
      return null;
    } catch (error) {
      debugPrint('Network Error: $error');
      rethrow;
    }
  }
}
