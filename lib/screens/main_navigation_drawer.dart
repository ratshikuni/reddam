import 'package:app/screens/Login.dart';
import 'package:flutter/material.dart';

class MainNavigationDrawer extends StatefulWidget {
  const MainNavigationDrawer({Key? key}) : super(key: key);

  @override
  State<MainNavigationDrawer> createState() => _MainNavigationDrawerState();
}

class _MainNavigationDrawerState extends State<MainNavigationDrawer> {
  String? currentImageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 7, 41, 69),
      child: Column(children: [
        const SizedBox(
          height: 80,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.home,
            color: Colors.white,
          ),
          title: const Text("Home",
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
          textColor: Colors.white,
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.mail,
            color: Colors.white,
          ),
          title: const Text("Notice",
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
          textColor: Colors.white,
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          title: const Text("Account",
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
          textColor: Colors.white,
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          leading: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          title: const Text("Logout",
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
          textColor: Colors.white,
        ),
      ]),
    );
  }
}
