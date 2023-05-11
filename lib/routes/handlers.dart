import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:simple_calendar/pages/create_event.dart';
import 'package:simple_calendar/pages/home.dart';
import 'package:simple_calendar/pages/weather.dart';

import '../pages/settings.dart';

var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Home();
});

var eventCreateHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const CreateEvent();
    });

var weatherHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const Weather();
    });

var settingsHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const Settings();
    });
