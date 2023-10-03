import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yt_downloader/domain/models/yt_video_response.dart' as response;
import 'package:yt_downloader/utils/extensions.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';

class DownloadInfo extends StatefulWidget {
  final response.Response videoResponse;
  const DownloadInfo({super.key, required this.videoResponse});

  @override
  State<DownloadInfo> createState() => _DownloadInfoState();
}

class _DownloadInfoState extends State<DownloadInfo> {
  double progress = 0;
  late DownloadStatus downloadStatus;

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
        // directory = Directory('/storage/emulated/0/Download');
        // if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        // }
      }
    } catch (err) {
      print("Cannot get download folder path");
    }
    return "${directory?.path}/$filename";
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var videoAudio = widget.videoResponse.videos?.where((video) {
      return video.hasAudio == true;
    }).toList();
    return Expanded(
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorPicker.colorScheme1,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: ColorPicker.colorScheme4),
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Column(children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: size.height * 0.12,
                    width: size.width * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                widget.videoResponse.thumbnails?.first.url ??
                                    "")),
                        color: Colors.yellow),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.videoResponse.title ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.videoResponse.channelName ?? "",
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              const Divider(
                height: 25,
                color: ColorPicker.colorScheme4,
              ),
              titleSection(ColorPicker.colorScheme3, 'Video'),
              Column(
                children: [
                  ...List.generate(videoAudio?.length ?? 0, (index) {
                    var video = videoAudio?[index];
                    var length = int.parse(video?.contentLength ?? "0");
                    int selectedIndex = 0;
                    print('/////////////// vlength: $length');
                    return downloadList(
                        video?.quality ?? "",
                        length.toMB(),
                        selectedIndex == index
                            ? () {
                                selectedIndex = index;
                                String url = video!.url ?? "";
                                String fileName =
                                    "${widget.videoResponse.title}_${index + 1}";
                                initializeDownload(url, fileName);
                              }
                            : () {});
                  }),
                ],
              ),
              titleSection(ColorPicker.colorScheme3, 'Audio'),
              Column(
                children: [
                  ...List.generate(widget.videoResponse.audios?.length ?? 0,
                      (index) {
                    var audio = widget.videoResponse.audios?[index];
                    int length =
                        int.parse(audio?.contentLength?.toString() ?? '0');
                    return downloadList(
                        audio?.quality?.split("_").last.toCamelCase() ?? "",
                        length.toMB(),
                        () {});
                  }),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget downloadList(String format, String mb, void Function()? onTap) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        decoration: const BoxDecoration(
          color: ColorPicker.colorScheme1,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(format),
          Row(
            children: [
              Text(
                mb,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.download,
                  color: ColorPicker.colorScheme5,
                ),
              ),
            ],
          )
        ]),
      );

  Widget titleSection(Color color, String title) => Container(
        width: double.infinity,
        color: color,
        padding: const EdgeInsets.all(8),
        child: Text(title),
      );
}
