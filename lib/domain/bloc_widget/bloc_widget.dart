import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yt_downloader/data/bloc/yt_video/yt_video_bloc.dart';
import 'package:yt_downloader/data/bloc/yt_video_player/yt_video_player_bloc.dart';
import 'package:yt_downloader/domain/repositories/yt_repository.dart';
import 'package:yt_downloader/domain/repositories/yt_video_repository.dart';

class BlocWidget extends StatelessWidget {
  final Widget child;
  const BlocWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => YtRepository(),
        ),
        RepositoryProvider(
          create: (context) => YtVideoRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => YtVideoBloc(
                ytRepository: RepositoryProvider.of<YtRepository>(context)),
          ),
          BlocProvider(
            create: (context) => YtVideoPlayerBloc(
              ytVideoRepository: RepositoryProvider.of<YtVideoRepository>(context)
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
