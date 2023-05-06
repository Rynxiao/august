import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/routes/application.dart';
import 'package:simple_calendar/routes/routes.dart';
import 'package:simple_calendar/states/global_state.dart';
import 'package:simple_calendar/states/home_state.dart';
import 'package:simple_calendar/theme/theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => GlobalState()),
      ChangeNotifierProvider(create: (context) => HomeState()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  MyAppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: globalState.isDarkMode ? darkTheme : lightTheme,
      onGenerateRoute: Application.router.generator,
    );
  }
}
