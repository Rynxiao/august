import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simple_calendar/models/weather_location.dart';

import 'http.dart';

const baseUrl = "devapi.qweather.com";

Future<WeatherLocation> getWeatherLocation(String cityName) async {
  final apiKey = dotenv.env['WEATHER_API_KEY'];

  final response = await Http.get("https://geoapi.qweather.com/v2/city/lookup", params: {
    'key': apiKey,
    'location': cityName,
  });

  return WeatherLocation.fromJson(response.data);
}
