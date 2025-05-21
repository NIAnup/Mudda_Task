import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mudda_task/controller/videofeedController.dart';
import 'package:mudda_task/widget/videopostWidget.dart';



class VideoFeedPage extends StatelessWidget {
  final controller = Get.put(VideoFeedController());

  final List<String> youtubeLinks = [
    'https://www.youtube.com/watch?v=K18cpp_-gP8',
    'https://www.youtube.com/watch?v=5qap5aO4i9A',
    'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
    'https://www.youtube.com/watch?v=oHg5SJYRHA0',
    'https://www.youtube.com/watch?v=3JZ_D3ELwOQ',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Icon(Icons.lightbulb_outline, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                'Mudda',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            Icon(Iconsax.notification, color: Colors.black),
            SizedBox(width: 12),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: NetworkImage(
                "https://plus.unsplash.com/premium_photo-1671656349218-5218444643d8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8fDB8fHww",
              ),
            ),
            SizedBox(width: 12),
          ],
          bottom: TabBar(
            labelColor: Colors.blue.shade900,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue.shade900,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            tabs: [
              Tab(text: 'Trending'),
              Tab(text: 'Group'),
              Tab(text: 'Following'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildVideoList(context, youtubeLinks),
            Center(child: Text('Group')),
            Center(child: Text('Following')),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue.shade900,
          unselectedItemColor: Colors.blue,
          iconSize: 30,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.add_circle),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.airdrop),
              label: 'Panchayat',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVideoList(BuildContext context, List<String> videoList) {
    return ListView.builder(
      itemCount: videoList.length,
      itemBuilder: (context, index) {
        return VideoPostWidget(
          username: index % 2 == 0 ? 'Ishan Verma' : 'Vikrant Mishra',
          title:
              'Quality of Education in Bihar Modern Bihar has an inadequate educational infrastructure creating a huge mismatch between demand and supply...',
          tags: ['#IndiaEducation', '#IndiaEducation'],
          location: 'Bihar(S)',
          category: index % 2 == 0 ? 'Education' : 'Government',
          daysAgo: '2 days ago',
          youtubeUrl: videoList[index],
          imageUrl:
              index % 2 == 0
                  ? 'https://plus.unsplash.com/premium_photo-1658527049634-15142565537a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGF2YXRhcnxlbnwwfHwwfHx8MA%3D%3D'
                  : 'https://images.unsplash.com/photo-1599566147214-ce487862ea4f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YXZhdGFyfGVufDB8fDB8fHww',

          index: index,
        );
      },
    );
  }
}
