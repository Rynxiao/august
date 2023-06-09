import 'package:flutter/material.dart';
import 'package:lunar/calendar/Lunar.dart';
import 'package:lunar/calendar/Solar.dart';
import 'package:simple_calendar/models/calendar/calendar_event.dart';

import '../models/calendar/calendar_date.dart';
import '../models/calendar/cycle_by.dart';
import '../models/calendar/year_and_month.dart';
import '../theme/colors.dart';
import '../utils/date_utils.dart';

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

List<String> getFestivalsBy(Solar solar, Lunar lunar) {
  final festivals = solar.getFestivals();
  festivals.addAll(lunar.getFestivals());
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

YearAndMonth getPrevYearAndMonth(int year, int month) {
  var prevMonth = month - 1;
  var prevYear = year;

  if (prevMonth < 1) {
    prevMonth = 12;
    prevYear -= 1;
  }
  return YearAndMonth(year: prevYear, month: prevMonth);
}

YearAndMonth getNextYearAndMonth(int year, int month) {
  var nextMonth = month + 1;
  var nextYear = year;

  if (nextMonth > 12) {
    nextMonth = 1;
    nextYear += 1;
  }
  return YearAndMonth(year: nextYear, month: nextMonth);
}

Lunar getLunarDetail(int year, int month, int day) {
  Solar solar = Solar.fromYmd(year, month, day);
  return solar.getLunar();
}

List<CalendarEvent> getDateEvents(
    List<CalendarEvent> dateEvents, CalendarDate date) {
  return dateEvents.where((dateEvent) {
    var isCycle = dateEvent.isCycle;
    var cycleBy = dateEvent.cycleBy;

    // 循环
    if (isCycle == IsCycle.yes.value) {
      // 农历循环
      if (cycleBy == CycleBy.lunar.value) {
        var lunarDate = dateEvent.lunarDate;
        var lunar = date.lunar;

        return lunarDate.substring(5, lunarDate.length) ==
            '${lunar.month}月${lunar.day}';
      } else {
        // 公历循环
        var dateId = dateEvent.dateId;
        return dateId.substring(4, dateId.length) ==
            '${formatNumber(date.month)}${formatNumber(date.day)}';
      }
    } else {
      return dateEvent.lunarDate == date.lunar.date;
    }
  }).toList();
}

List<CalendarEvent> getDateEventsBy(
    List<CalendarEvent> dateEvents, Solar solar, Lunar lunar) {
  return dateEvents.where((dateEvent) {
    var isCycle = dateEvent.isCycle;
    var cycleBy = dateEvent.cycleBy;

    // 循环
    if (isCycle == IsCycle.yes.value) {
      // 农历循环
      if (cycleBy == CycleBy.lunar.value) {
        var lunarDate = dateEvent.lunarDate;

        return lunarDate.substring(5, lunarDate.length) ==
            '${lunar.getMonthInChinese()}月${lunar.getDayInChinese()}';
      } else {
        // 公历循环
        var dateId = dateEvent.dateId;
        return dateId.substring(4, dateId.length) ==
            '${formatNumber(solar.getMonth())}${formatNumber(solar.getDay())}';
      }
    } else {
      return dateEvent.lunarDate == lunar.toString();
    }
  }).toList();
}