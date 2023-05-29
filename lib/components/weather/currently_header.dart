import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/components/weather/weather_icon.dart';
import 'package:simple_calendar/core/weather_utils.dart';
import 'dart:math' as math;

import '../../states/weather_state.dart';
import '../../theme/colors.dart';

class CurrentlyHeader extends StatelessWidget {
  const CurrentlyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherState = Provider.of<WeatherState>(context);
    final now = weatherState.now;
    final location = weatherState.location;

    return LayoutBuilder(
      builder: (context, _) {
        final settings = context
            .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
        var opacity = 1.0;
        if (settings != null) {
          final deltaExtent = settings.maxExtent - settings.minExtent;
          final t = (1.0 -
                  (settings.currentExtent - settings.minExtent) / deltaExtent)
              .clamp(0.0, 1.0);
          final fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
          const fadeEnd = 1.0;
          opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);
        }

        return Stack(
          children: [
            AnimatedOpacity(
              opacity: 1 - opacity,
              duration: const Duration(milliseconds: 500),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 20,
                ),
                child: Center(
                  child: Text(
                    '${location.name} ${now.text} ${now.temp}°C',
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: opacity > 0.6,
              child: AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 500),
                child: Transform.scale(
                  scale: opacity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 42,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              WeatherIcon(
                                color: getIconColor(now.text),
                                name: '${now.icon}-fill',
                                size: 80,
                              ),
                              const Text(
                                "|",
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    now.temp,
                                    style: const TextStyle(
                                        fontSize: 70.0,
                                        color: Colors.white,
                                        shadows: [
                                          BoxShadow(
                                            color: AppColors.orangeRed,
                                            blurRadius: 100,
                                          )
                                        ]),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 14.0,
                                      left: 4.0,
                                    ),
                                    child: Text(
                                      "°C",
                                      style: TextStyle(
                                        fontSize: 28.0,
                                        color: AppColors.orangeRed,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.my_location,
                                color: AppColors.orangeRed,
                              ),
                            ),
                            Text(
                              location.name,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
