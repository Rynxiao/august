import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/components/weather/weather_icon.dart';
import 'package:simple_calendar/models/weather/daily.dart';
import 'package:simple_calendar/utils/date_utils.dart';

import '../../states/weather_state.dart';

class SevenDayForecast extends StatelessWidget {
  const SevenDayForecast({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherState = Provider.of<WeatherState>(context);
    final daily = weatherState.daily;

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
            ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: daily.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return _buildSevenDayItem(daily[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Column _buildSevenDayItem(Daily daily) {
    var dateText =
        isToday(daily.fxDate) ? '今天' : formatMonthAndDay(daily.fxDate);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 90,
                    child: Text(
                      dateText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  WeatherIcon(
                    color: Colors.white,
                    name: '${daily.iconDay}-fill',
                    size: 28,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "${daily.tempMin}°C ",
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
                  Text(
                    " ${daily.tempMax}°C",
                    style: const TextStyle(
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
      ],
    );
  }
}
