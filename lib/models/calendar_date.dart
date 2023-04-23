import 'dart:ffi';

class LunarDate {
  final String date;
  final String year;
  final String month;
  final String day;
  final String week;
  final List<String> festivals;
  final String chineseZodiac;   // 生肖
  final String? solarTerm;      // 节气
  final bool? isWork;

  LunarDate({
    required this.date,
    required this.year,
    required this.month,
    required this.day,
    required this.week,
    required this.festivals,
    required this.chineseZodiac,
    required this.solarTerm,
    required this.isWork
  });
}

class CalendarDate {
  final String date;
  final int year;
  final int month;
  final int day;
  final int weekday;
  final String constellation; // 星座
  final List<String> festivals;
  final LunarDate lunar;

  CalendarDate({
    required this.date,
    required this.year,
    required this.month,
    required this.day,
    required this.weekday,
    required this.constellation,
    required this.festivals,
    required this.lunar
  });
}