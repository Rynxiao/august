import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:simple_calendar/pages/create_event.dart';
import 'package:simple_calendar/pages/home.dart';
import 'package:simple_calendar/pages/update_event.dart';
import 'package:simple_calendar/pages/weather.dart';

import '../pages/about.dart';
import '../pages/settings.dart';

var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Home();
});

var eventCreateHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    var year = int.parse(params["year"][0]);
    var month = int.parse(params["month"][0]);
    var day = int.parse(params["day"][0]);

    return CreateEvent(
      year: year,
      month: month,
      day: day,
    );
  },
);

var eventUpdateHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    var eventId = params["eventId"][0];

    return UpdateEvent(eventId: eventId);
  },
);

var weatherHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Weather();
});

var settingsHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Settings();
});

var aboutHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const About();
    });
