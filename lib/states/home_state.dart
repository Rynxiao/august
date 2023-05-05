import 'package:flutter/foundation.dart';

import '../core/calendar.dart';
import '../models/calendar_date.dart';

class HomeState extends ChangeNotifier {
  int _selectedYear = 0;
  int _selectedMonth = 0;
  int _selectedDay = 0;
  late List<CalendarDate> _calendarDates;
  final Calendar _calendar = Calendar();

  HomeState() {
    final now = DateTime.now();
    setSelectedYMD(now.year, now.month, now.day);
    setCalendarDates(now.year, now.month);
  }

  int get selectedYear => _selectedYear;

  int get selectedMonth => _selectedMonth;

  int get selectedDay => _selectedDay;

  Calendar get calendar => _calendar;

  List<CalendarDate> get calendarDates => _calendarDates;

  void select(int year, int month, int day) {
    if (isPreviousMonth(year, month) || isNextMonth(year, month)) {
      setCalendarDates(year, month);
    }

    setSelectedYMD(year, month, day);
    notifyListeners();
  }

  void setSelectedYMD(int year, int month, int day) {
    _selectedYear = year;
    _selectedMonth = month;
    _selectedDay = day;
  }

  void setCalendarDates(int year, int month) {
    _calendarDates =
        _calendar.getCalendarForMonth(year, month, startWithSunday: true);

    notifyListeners();
  }

  bool isSelected(int year, int month, int day) {
    return year == selectedYear && month == selectedMonth && day == selectedDay;
  }

  bool isPreviousMonth(int year, int month) {
    if (year == selectedYear) {
      return month < selectedMonth;
    }

    return year < selectedYear;
  }

  bool isNextMonth(int year, int month) {
    if (year == selectedYear) {
      return month > selectedMonth;
    }

    return year > selectedYear;
  }
}
