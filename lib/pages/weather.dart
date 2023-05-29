import 'package:flutter/material.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/widgets/weather/currently_header.dart';
import 'package:simple_calendar/widgets/weather/seven_day_forecast.dart';

import '../widgets/weather/current_detail.dart';
import '../widgets/weather/custom_clipper_container.dart';
import '../widgets/weather/hourly_forecast.dart';
import '../core/weather_utils.dart';
import '../routes/routes.dart';
import '../states/weather_state.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    double safeAreaTop = mediaQueryData.padding.top;

    final weatherState = Provider.of<WeatherState>(context);
    final now = weatherState.now;

    return Scaffold(
      body: Stack(children: [
        WeatherBg(
          weatherType: getWeatherTypeBy(now.text, now.icon),
          width: screenWidth,
          height: screenHeight,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(height: safeAreaTop),
            Expanded(
              child: NestedScrollView(
                floatHeaderSlivers: true,
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    const SliverAppBar(
                      pinned: true,
                      stretch: true,
                      collapsedHeight: 60.0,
                      expandedHeight: 160.0,
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      flexibleSpace: CurrentlyHeader(),
                    ),
                  ];
                },
                body: CustomClipperContainer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      HourlyForecast(),
                      SevenDayForecast(),
                      CurrentDetail(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
      bottomNavigationBar: renderBottomNavigationBar(context, 1),
    );
  }
}
