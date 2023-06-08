import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/widgets/weather/weather_icon.dart';
import 'package:simple_calendar/core/weather_utils.dart';
import 'package:simple_calendar/models/weather/hourly.dart';
import 'package:simple_calendar/states/weather_state.dart';
import 'package:simple_calendar/utils/date_utils.dart';

import '../../theme/spacing.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherState = Provider.of<WeatherState>(context);
    final hourly = weatherState.hourly;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Spacing.s),
        color: Colors.black.withOpacity(0.15),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.schedule,
                      color: Colors.white.withOpacity(0.6),
                      size: 16,
                    ),
                  ),
                  Text(
                    "每小时天气预报",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(hourly.length, (index) {
                  return _buildHourWeatherItem(hourly[index]);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildHourWeatherItem(Hourly hourly) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              "${getHour(hourly.fxTime)}:00",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: WeatherIcon(
              color: getIconColor(hourly.text),
              name: '${hourly.icon}-fill',
            ),
          ),
          Text(
            "${hourly.temp}°",
            style: TextStyle(
              color: getTempColor(hourly.temp),
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          )
        ],
      ),
    );
  }
}
