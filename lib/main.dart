import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/pages/home.dart';
import 'package:simple_calendar/states/home_state.dart';
import 'package:simple_calendar/theme/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeState())
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = true;

    void toggleTheme() {
      setState(() {
        isDarkMode = !isDarkMode;
      });
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: isDarkMode ? darkTheme : lightTheme,
      routes: {
        "/": (context) => const Home(title: "Flutter Demo Home Page")
      },
    );
  }
}
