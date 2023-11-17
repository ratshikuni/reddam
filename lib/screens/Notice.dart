import 'package:app/screens/main_navigation_drawer.dart';
import 'package:flutter/material.dart';

class NoticeScreen extends StatefulWidget {
  NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  // Sample announcements data
  List<Map<String, dynamic>> announcements = [
    {
      "title": "Announcement 1",
      "content": "This is the content of Announcement 1.",
      "date": DateTime(2023, 11, 15),
    },
    {
      "title": "Announcement 2",
      "content": "This is the content of Announcement 2.",
      "date": DateTime(2023, 11, 16),
    },
    {
      "title": "Announcement 3",
      "content": "This is the content of Announcement 3.",
      "date": DateTime(2023, 11, 17),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notice"),
        backgroundColor: Color.fromARGB(255, 7, 41, 69),
      ),
      drawer: Drawer(
        child: MainNavigationDrawer(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Display announcements using a ListView.builder
              Expanded(
                child: ListView.builder(
                  itemCount: announcements.length,
                  itemBuilder: (context, index) {
                    return AnnouncementCard(announcement: announcements[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final Map<String, dynamic> announcement;

  const AnnouncementCard({Key? key, required this.announcement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              announcement["title"],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              announcement["content"],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Date: ${announcement["date"].toLocal()}",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

