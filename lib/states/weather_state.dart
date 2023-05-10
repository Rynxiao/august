import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import '../models/weather/weather_location.dart';
import '../models/weather/weather_now.dart';
import '../models/weather/weather_seven_days.dart';
import '../models/weather/weather_twenty_four_hours.dart';
import '../models/weather/daily.dart';
import '../models/weather/hourly.dart';
import '../models/weather/location.dart';
import '../models/weather/now.dart';
import '../network/api.dart';

class WeatherState extends ChangeNotifier {
  Position position;

  Location location = Location.empty();
  Now now = Now.empty();
  List<Hourly> hourly = [];
  List<Daily> daily = [];

  WeatherState(this.position);

  Future<void> getWeatherInfo() async {
    final location = "${position.longitude},${position.latitude}";
    final responses = await loadAllWeatherData(location);

    if (responses.isNotEmpty && responses.length == 4) {
      final weatherLocation = responses[0] as WeatherLocation;
      final weatherNow = responses[1] as WeatherNow;
      final weatherHourly = responses[2] as WeatherTwentyFourHours;
      final weatherDaily = responses[3] as WeatherSevenDays;
      setWeatherInfo(
        weatherLocation.location[0],
        weatherNow.now,
        weatherHourly.hourly,
        weatherDaily.daily,
      );
    }
  }

  void setWeatherInfo(
    Location location,
    Now now,
    List<Hourly> hourly,
    List<Daily> daily,
  ) {
    this.location = location;
    this.now = now;
    this.hourly = hourly;
    this.daily = daily;

    notifyListeners();
  }
}
