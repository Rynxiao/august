import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_calendar/components/weather/weather_icon.dart';

class SevenDayForecast extends StatelessWidget {
  const SevenDayForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white.withOpacity(0.15),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 20,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.white.withOpacity(0.6),
                      size: 16,
                    ),
                  ),
                  Text(
                    "7天天气预报",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
            _buildSevenDayItem(),
          ],
        ),
      ),
    );
  }

  Column _buildSevenDayItem() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 24.0),
                    child: Text(
                      "今天",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  WeatherIcon(
                    color: Colors.white,
                    name: '306-fill',
                    size: 28,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "25°C ",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.45),
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    "/",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    " 32°C",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
