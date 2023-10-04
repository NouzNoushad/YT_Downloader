import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yt_downloader/data/bloc/download_bloc/download_bloc.dart';
import 'package:yt_downloader/domain/models/yt_video_response.dart' as response;
import 'package:yt_downloader/utils/extensions.dart';
import '../../../utils/colors.dart';

class DownloadInfo extends StatefulWidget {
  final response.Response videoResponse;
  const DownloadInfo({super.key, required this.videoResponse});

  @override
  State<DownloadInfo> createState() => _DownloadInfoState();
}

class _DownloadInfoState extends State<DownloadInfo> {
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
                                // initializeDownload(url, fileName);
                                context
                                    .read<DownloadBloc>()
                                    .add(DownloadLoadedEvent(url, fileName));
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
                    int selectedIndex = 0;
                    int length =
                        int.parse(audio?.contentLength?.toString() ?? '0');
                    return downloadList(
                        audio?.quality?.split("_").last.toCamelCase() ?? "",
                        length.toMB(),
                        selectedIndex == index
                            ? () {
                                selectedIndex = index;
                                String url = audio!.url ?? "";
                                String fileName =
                                    "${widget.videoResponse.title}_${index + 1}";
                                // initializeDownload(url, fileName);
                                context
                                    .read<DownloadBloc>()
                                    .add(DownloadLoadedEvent(url, fileName));
                              }
                            : () {});
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
