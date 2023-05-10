import 'package:flutter/material.dart';
import 'package:flutter_weather_bg/bg/weather_bg.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';
import 'package:provider/provider.dart';

import '../components/custom_scaffold.dart';
import '../routes/routes.dart';
import '../states/global_state.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    final isDarkMode = globalState.isDarkMode;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: WeatherBg(
              weatherType: WeatherType.thunder,
              width: screenWidth,
              height: screenHeight,
            ),
          ),
        ],
      ),
      bottomNavigationBar: renderBottomNavigationBar(context, 1),
    );
  }
}
