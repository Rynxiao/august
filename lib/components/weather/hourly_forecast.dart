import 'package:flutter/material.dart';
import 'package:simple_calendar/components/weather/weather_icon.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white.withOpacity(0.15),
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
              padding:
              const EdgeInsets.only(bottom: 12.0),
              child: Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.punch_clock,
                      color:
                      Colors.white.withOpacity(0.6),
                      size: 16,
                    ),
                  ),
                  Text(
                    "每小时天气预报",
                    style: TextStyle(
                      color:
                      Colors.white.withOpacity(0.6),
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                  _buildHourWeatherItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildHourWeatherItem() {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Text(
              "现在",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: WeatherIcon(color: Colors.amber, name: '100-fill'),
          ),
          Text(
            "28°",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          )
        ],
      ),
    );
  }
}