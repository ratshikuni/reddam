import 'package:app/screens/main_navigation_drawer.dart';
import 'package:flutter/material.dart';

class NoticeScreen extends StatefulWidget {
  NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
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
      body: Center(child: Column(children: [Text("Empty")])),
    );
  }
}
