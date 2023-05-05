import 'dart:ui';

import '../models/calendar_date.dart';
import '../theme/colors.dart';

String getLunarText(List<String> festivals, LunarDate lunar) {
  final solarTerm = lunar.solarTerm;
  return festivals.isNotEmpty ? festivals[0] : solarTerm ?? lunar.day;
}

Color getLunarDateColor(List<String> festivals, LunarDate lunar) {
  final solarTerm = lunar.solarTerm;
  return festivals.isNotEmpty
      ? AppColors.orangeRed
      : solarTerm != null
      ? AppColors.green
      : AppColors.white;
}

List<String> getFestivals(CalendarDate date) {
  final lunar = date.lunar;
  final festivals = date.festivals;
  festivals.addAll(lunar.festivals);
  return festivals;
}

Color getSubscriptTextColor(LunarDate lunar) {
  final isWork = lunar.isWork;
  var topTextColor =
  isWork != null && isWork ? AppColors.orangeRed : AppColors.green;
  return topTextColor;
}

String getSubscriptText(LunarDate lunar) {
  final isWork = lunar.isWork;
  var topText = isWork != null && isWork ? '班' : '休';
  return topText;
}

Color getDateColor(CalendarDate date) {
  var dateColor = date.weekday == 6 || date.weekday == 7
      ? AppColors.orangeRed.withOpacity(0.7)
      : AppColors.white;
  return dateColor;
}