import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/repositories/yt_download_abstract.dart';
import '../../utils/constant.dart';

class YtDownloadRepository extends YtDownloadModel {
  double progress = 0;
  late DownloadStatus downloadStatus;

  @override
  Future<void> initializeDownload(String url, String fileName) async {
    Dio dio = Dio();
    final String date = DateTime.now().microsecondsSinceEpoch.toString();
    String fileName = "$date.mp4";
    String? path = await getDownloadPath(fileName);
    debugPrint('///////////////////////////// url: $url, fileName: $fileName');
    await dio.download(
      url,
      path,
      onReceiveProgress: (receivedBytes, totalBytes) {
        debugPrint('${receivedBytes / totalBytes}');
        progress = receivedBytes / totalBytes;
      },
      deleteOnError: true,
    ).then((_) {
      downloadStatus = DownloadStatus.success;
      debugPrint('///////////////////////////// video Downloaded');
    });
    // .onError((error, stackTrace) {
    //   downloadStatus = DownloadStatus.error;
    //   debugPrint('/////////////////////////// Download Error');
    // });
  }

  // Future<String> _getFilePath(String filename) async {
  //   final dir = Directory('/storage/emulated/0/Download');
  //   return "${dir.path}/$filename";
  // }

  Future<String?> getDownloadPath(String filename) async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      print("Cannot get download folder path");
    }
    return "${directory?.path}/$filename";
  }
}
