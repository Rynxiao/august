import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simple_calendar/models/weather_location.dart';
import 'package:simple_calendar/models/weather_now.dart';
import 'package:simple_calendar/models/weather_seven_days.dart';

import '../models/weather_twenty_four_hours.dart';
import 'http.dart';

const locationUrl = "https://geoapi.qweather.com/v2/city/lookup";
const baseUrl = "https://devapi.qweather.com/v7/weather";

Future<WeatherLocation> getWeatherLocation(String locationId) async {
  final apiKey = dotenv.env['WEATHER_API_KEY'];

  final response = await Http.get(locationUrl, params: {
    'key': apiKey,
    'location': locationId,
  });

  return WeatherLocation.fromJson(response.data);
}

Future<WeatherNow> getCurrentWeather(String locationId) async {
  final apiKey = dotenv.env['WEATHER_API_KEY'];

  final response = await Http.get("$baseUrl/now", params: {
    'key': apiKey,
    'location': locationId,
  });

  return WeatherNow.fromJson(response.data);
}

Future<WeatherTwentyFourHours> getWeatherFor24Hours(String locationId) async {
  final apiKey = dotenv.env['WEATHER_API_KEY'];

  final response = await Http.get("$baseUrl/24h", params: {
    'key': apiKey,
    'location': locationId,
  });

  return WeatherTwentyFourHours.fromJson(response.data);
}

Future<WeatherSevenDays> getWeatherFor7Days(String locationId) async {
  final apiKey = dotenv.env['WEATHER_API_KEY'];

  final response = await Http.get("$baseUrl/7d", params: {
    'key': apiKey,
    'location': locationId,
  });

  return WeatherSevenDays.fromJson(response.data);
}

Future<List<dynamic>> loadAllWeatherData(String locationId) async {
  return await Future.wait([
    getWeatherLocation(locationId),
    getCurrentWeather(locationId),
    getWeatherFor24Hours(locationId),
    getWeatherFor7Days(locationId),
  ]);
}
