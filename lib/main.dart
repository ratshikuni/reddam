import 'package:app/screens/Login.dart';
// import 'package:app/screens/calendar.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(CalendarApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
