import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/models/weather/daily_item.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../models/weather/now.dart';
import '../../states/weather_state.dart';
import '../../theme/colors.dart';

class CurrentDetail extends StatelessWidget {
  const CurrentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherState = Provider.of<WeatherState>(context);
    final now = weatherState.now;
    final weatherDetailList = _buildWeatherDetailList(now);

    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: weatherDetailList.length,
        itemBuilder: (context, index) {
          var item = weatherDetailList[index];

          return Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: BoxedIcon(
                      WeatherIcons.fromString(
                        item.iconName,
                        fallback: const IconData(0xf07b),
                      ),
                      color: AppColors.white,
                      size: 46,
                    ),
                  ),
                  Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

List<DailyItem> _buildWeatherDetailList(Now now) {
  return [
    DailyItem(iconName: 'wind_deg_45', name: '风向', value: now.windDir),
    DailyItem(iconName: 'wi-strong_wind', name: '风力等级', value: now.windScale),
    DailyItem(iconName: 'wi-humidity', name: '湿度', value: '${now.humidity}%'),
    DailyItem(iconName: 'wi-raindrops', name: '降水量', value: '${now.precip}cm/小时'),
    DailyItem(iconName: 'wi-alien', name: '能见度', value: '${now.vis}/公里'),
  ];
}
