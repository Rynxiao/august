import 'package:flutter/material.dart';
import 'package:flutter_weather_bg/utils/weather_type.dart';

WeatherType getWeatherTypeBy(String weatherText, String icon) {
  if (weatherText == '晴') {
    if (icon == '100') {
      return WeatherType.sunny;
    } else {
      return WeatherType.sunnyNight;
    }
  } else if (weatherText.contains('云')) {
    if (icon == '101' || icon == '102' || icon == '103') {
      return WeatherType.cloudy;
    } else {
      return WeatherType.cloudyNight;
    }
  } else if (weatherText == '阴') {
    return WeatherType.overcast;
  } else if (weatherText.contains('雷')) {
    return WeatherType.thunder;
  } else if (weatherText.contains('雪')) {
    if (weatherText == '小雪') {
      return WeatherType.lightSnow;
    } else if (weatherText == '中雪' || weatherText == '大到中雪') {
      return WeatherType.middleSnow;
    } else if (weatherText == '大雪' ||
        weatherText == '暴雪' ||
        weatherText == '中到大雪' ||
        weatherText == '大到暴雪') {
      return WeatherType.heavySnow;
    } else {
      return WeatherType.lightSnow;
    }
  } else if (weatherText.contains('雨')) {
    if (weatherText == '小雨') {
      return WeatherType.lightRainy;
    } else if (weatherText == '中雨' || weatherText == '小到中雨') {
      return WeatherType.middleRainy;
    } else if (weatherText == '大雨' ||
        weatherText == '暴雨' ||
        weatherText == '大暴雨' ||
        weatherText == '特大暴雨' ||
        weatherText == '中到大雨' ||
        weatherText == '暴雨到大暴雨' ||
        weatherText == '大暴雨到特大暴雨' ||
        weatherText == '极端降雨' ||
        weatherText == '强阵雨') {
      return WeatherType.heavyRainy;
    } else {
      return WeatherType.lightRainy;
    }
  } else if (weatherText.contains('雾')) {
    return WeatherType.hazy;
  } else if (weatherText.contains('霾')) {
    return WeatherType.foggy;
  } else if (weatherText.contains('尘') || weatherText == '扬沙') {
    return WeatherType.dusty;
  } else {
    return WeatherType.sunny;
  }
}

Color getIconColor(String weatherText) {
  if (weatherText == '晴') {
    return Colors.amber;
  } else if (weatherText.contains('云')) {
    return const Color(0xFF8FA3C0);
  } else if (weatherText.contains('雾')) {
    return const Color(0xFF3A4B65);
  } else if (weatherText.contains('霾')) {
    return const Color(0xFF989898);
  } else if (weatherText.contains('尘') || weatherText == '扬沙') {
    return const Color(0xFFB99D79);
  } else {
    return Colors.white;
  }
}
