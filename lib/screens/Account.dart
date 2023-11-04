import 'package:app/screens/main_navigation_drawer.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String Name = "shoba";
  int Total_hours = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts"),
        backgroundColor: Color.fromARGB(255, 7, 41, 69),
      ),
      drawer: Drawer(
        child: MainNavigationDrawer(),
      ),
      body: Center(child: Column(children: [Text("Empty")])),
    );
  }
}
