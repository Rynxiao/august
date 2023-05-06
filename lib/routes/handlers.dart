import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:simple_calendar/pages/home.dart';

import '../pages/settings.dart';

var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Home();
});

var settingsHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const Settings();
    });
