import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:simple_calendar/routes/application.dart';
import 'package:simple_calendar/utils/logger.dart';

import 'handlers.dart';

// https://pub.dev/packages/fluro
class Routes {
  static String home = "/";
  static String weather = "/weather";
  static String commonSense = "/commonSense";
  static String settings = "/settings";
  static String eventCreate = "/eventCreate/:year/:month/:day";
  static String eventUpdate = "/eventUpdate/:eventId";
  static String about = "/about";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      Logger.e("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(home, handler: homeHandler);
    router.define(weather, handler: weatherHandler);
    router.define(commonSense, handler: commonSenseHandler);
    router.define(settings, handler: settingsHandler);
    router.define(eventCreate, handler: eventCreateHandler);
    router.define(eventUpdate, handler: eventUpdateHandler);
    router.define(about, handler: aboutHandler);
  }
}

Container renderBottomNavigationBar(BuildContext context, int currentIndex) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          color: Theme.of(context).dividerColor,
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
          icon: Icon(Icons.lightbulb),
          label: '常识',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '设置',
        ),
      ],
      selectedItemColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).colorScheme.background,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        switch (index) {
          case 0:
            navigateTo(context, Routes.home);
            break;
          case 1:
            navigateTo(context, Routes.weather);
            break;
          case 2:
            navigateTo(context, Routes.commonSense);
            break;
          case 3:
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
    clearStack: true
  );
}
