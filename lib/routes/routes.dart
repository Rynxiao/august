import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:simple_calendar/routes/application.dart';
import 'package:simple_calendar/utils/logger.dart';

import 'handlers.dart';

// https://pub.dev/packages/fluro
class Routes {
  static String home = "/";
  static String eventCreate = "/eventCreate/:year/:month/:day";
  static String eventUpdate = "/eventUpdate/:eventId";
  static String about = "/about";
  static String senseDetail = "/senseDetail/:id";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      Logger.e("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(home, handler: homeHandler);
    router.define(eventCreate, handler: eventCreateHandler);
    router.define(eventUpdate, handler: eventUpdateHandler);
    router.define(about, handler: aboutHandler);
    router.define(senseDetail, handler: senseDetailHandler);
  }
}

FlashyTabBar renderBottomNavigationBar(
  BuildContext context,
  int currentIndex,
  Null Function(dynamic index) onSelect,
) {
  return FlashyTabBar(
    selectedIndex: currentIndex,
    showElevation: true,
    backgroundColor: Theme.of(context).colorScheme.background,
    onItemSelected: (index) {
      onSelect(index);
    },
    items: [
      FlashyTabBarItem(
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Theme.of(context).colorScheme.surface,
        icon: const Icon(Icons.calendar_month),
        title: const Text('万年历'),
      ),
      FlashyTabBarItem(
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Theme.of(context).colorScheme.surface,
        icon: const Icon(Icons.sunny),
        title: const Text('天气'),
      ),
      FlashyTabBarItem(
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Theme.of(context).colorScheme.surface,
        icon: const Icon(Icons.lightbulb),
        title: const Text('小常识'),
      ),
      FlashyTabBarItem(
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Theme.of(context).colorScheme.surface,
        icon: const Icon(Icons.settings),
        title: const Text('设置'),
      ),
    ],
  );
}

void navigateTo(
  BuildContext context,
  String route, {
  TransitionType transitionType = TransitionType.inFromRight,
  bool replace = false,
  bool clearStack = false,
  bool maintainState = true,
  bool rootNavigator = false,
}) {
  Application.router.navigateTo(
    context,
    route,
    transition: transitionType,
    replace: replace,
    clearStack: clearStack,
    maintainState: maintainState,
    rootNavigator: rootNavigator,
  );
}
