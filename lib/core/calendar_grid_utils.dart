import 'package:flutter/material.dart';

import '../models/calendar_date.dart';
import '../theme/colors.dart';

String getLunarText(List<String> festivals, LunarDate lunar) {
  final solarTerm = lunar.solarTerm;
  if (festivals.isNotEmpty) {
    final festival = festivals[0];
    return festival.length < 4 ? festival : lunar.day;
  } else {
    return solarTerm ?? lunar.day;
  }
}

Color? getLunarDateColor(
    List<String> festivals, LunarDate lunar, BuildContext context) {
  var highlightColor = Theme.of(context).highlightColor;

  final solarTerm = lunar.solarTerm;
  return festivals.isNotEmpty
      ? highlightColor
      : solarTerm != null
          ? AppColors.green
          : Theme.of(context).colorScheme.surface;
}

List<String> getFestivals(CalendarDate date) {
  final lunar = date.lunar;
  final festivals = date.festivals;
  festivals.addAll(lunar.festivals);
  return festivals;
}

Color getSubscriptBackgroundColor(LunarDate lunar, BuildContext context) {
  final highlightColor = Theme.of(context).highlightColor;
  final isWork = lunar.isWork;
  var topTextColor =
      isWork != null && isWork ? highlightColor : AppColors.green;
  return topTextColor;
}

String getSubscriptText(LunarDate lunar) {
  final isWork = lunar.isWork;
  var topText = isWork != null && isWork ? '班' : '休';
  return topText;
}

Color getDateColor(CalendarDate date, BuildContext context) {
  var highlightColor = Theme.of(context).highlightColor;

  var dateColor = date.weekday == 6 || date.weekday == 7
      ? highlightColor.withOpacity(0.7)
      : Theme.of(context).colorScheme.surface;
  return dateColor;
}
