import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudda_task/ui/videofeed.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoFeedPage(),
    );
  }
}
