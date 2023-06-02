import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:simple_calendar/db/sense_type.dart';

import '../models/commonSense/sense_type.dart';
import '../models/weather/weather_location.dart';
import '../models/weather/weather_now.dart';
import '../models/weather/weather_seven_days.dart';
import '../models/weather/weather_twenty_four_hours.dart';
import '../models/weather/daily.dart';
import '../models/weather/hourly.dart';
import '../models/weather/location.dart';
import '../models/weather/now.dart';
import '../network/api.dart';

class SenseState extends ChangeNotifier {
  List<SenseType> types = [SenseType(id: '0', title: '最新')];

  Future<void> getAllTypes() async {
    final responses = await SenseTypeDB.getAllSenseType();

    if (responses.isNotEmpty) {
      types = { ...types, ...responses }.toList();
      notifyListeners();
    }
  }
}
