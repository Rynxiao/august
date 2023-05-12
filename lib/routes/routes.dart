import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:simple_calendar/routes/application.dart';

import 'handlers.dart';

// https://pub.dev/packages/fluro
class Routes {
  static String home = "/";
  static String eventCreate = "/eventCreate/:year/:month/:day";
  static String weather = "/weather";
  static String settings = "/settings";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
          return;
        });
    router.define(home, handler: homeHandler);
    router.define(eventCreate, handler: eventCreateHandler);
    router.define(weather, handler: weatherHandler);
    router.define(settings, handler: settingsHandler);
  }
}

Container renderBottomNavigationBar(BuildContext context, int currentIndex) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          color: Theme
              .of(context)
              .dividerColor,
          width: 0.2,
        ),
      ),
    ),
    child: BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: '万年历',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sunny),
          label: '天气',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '设置',
        ),
      ],
      selectedItemColor: Theme
          .of(context)
          .primaryColor,
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            navigateTo(context, Routes.home);
            break;
          case 1:
            navigateTo(context, Routes.weather);
            break;
          case 2:
            navigateTo(context, Routes.settings);
            break;
        }
      },
    ),
  );
}

void navigateTo(BuildContext context, String route,
    {TransitionType transitionType = TransitionType.none}) {
  Application.router.navigateTo(
    context,
    route,
    transition: transitionType,
  );
}
