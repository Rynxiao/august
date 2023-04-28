import 'package:flutter/material.dart';
import 'package:simple_calendar/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: {
        "/": (context) => Home(title: "Flutter Demo Home Page")
      },
    );
  }
}
