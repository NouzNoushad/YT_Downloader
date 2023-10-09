import 'package:flutter/material.dart';
import 'package:yt_downloader/domain/bloc_widget/bloc_widget.dart';
import 'package:yt_downloader/routes/route_constant.dart';
import 'package:yt_downloader/routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocWidget(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        initialRoute: RouteConstant.home,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
