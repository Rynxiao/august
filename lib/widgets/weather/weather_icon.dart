import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIcon extends StatelessWidget {
  final double? size;
  final Color color;
  final String name;

  const WeatherIcon({
    super.key,
    this.size = 24,
    required this.color,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'statics/icons/$name.svg',
      width: size,
      height: size,
      color: color,
      placeholderBuilder: (BuildContext context) => BoxedIcon(
        WeatherIcons.na,
        size: size,
        color: color,
      ),
    );
  }
}
