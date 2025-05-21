import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mudda_task/controller/videofeedController.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPostWidget extends StatelessWidget {
  final String username;
  final String title;
  final List<String> tags;
  final String location;
  final String category;
  final String daysAgo;
  final String youtubeUrl;
  final String imageUrl;
  final int index;

  VideoPostWidget({
    required this.username,
    required this.title,
    required this.tags,
    required this.location,
    required this.category,
    required this.daysAgo,
    required this.youtubeUrl,
    required this.index,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VideoFeedController>();
    final videoId = YoutubePlayer.convertUrlToId(youtubeUrl)!;
    final _ytController = YoutubePlayerController(
      initialVideoId: videoId,

      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );

    return Obx(() {
      if (controller.playingIndex.value == index) {
        _ytController.play();
      } else {
        _ytController.pause();
      }

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 2),
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      radius: 26,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              username,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.verified, color: Colors.blue, size: 16),
                            SizedBox(width: 10),
                            Text(
                              "Follow",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: Colors.blue.shade900,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "$location • Problem • $category",
                          style: TextStyle(fontSize: 13, color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  daysAgo,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(title, maxLines: 3, overflow: TextOverflow.ellipsis),
            SizedBox(height: 6),
            Wrap(
              spacing: 8,
              children:
                  tags
                      .map(
                        (tag) => Text(
                          tag,
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                      .toList(),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                controller.playingIndex.value = index;
              },
              child: YoutubePlayer(
                controller: _ytController,
                showVideoProgressIndicator: true,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Iconsax.heart, size: 20, color: Colors.pink),
                SizedBox(width: 2),
                Text("Likes", style: TextStyle(color: Colors.pink)),
                SizedBox(width: 12),
                Icon(Iconsax.message_text_1, size: 20, color: Colors.grey),
                SizedBox(width: 6),
                Text("Comments"),
                SizedBox(width: 70),
                Icon(Iconsax.send_2, size: 20, color: Colors.grey),
                SizedBox(width: 6),
                Text("Share"),
              ],
            ),
          ],
        ),
      );
    });
  }
}
