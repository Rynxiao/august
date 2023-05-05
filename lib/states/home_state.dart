import 'package:flutter/foundation.dart';

import '../core/calendar.dart';
import '../models/calendar_date.dart';

class HomeState extends ChangeNotifier {
  late int _selectedYear;
  late int _selectedMonth;
  late int _selectedDay;
  late List<CalendarDate> _calendarDates;
  final Calendar _calendar = Calendar();

  HomeState() {
    final now = DateTime.now();
    select(now.year, now.month, now.day);
    setCalendarDates();
  }

  int get selectedYear => _selectedYear;

  int get selectedMonth => _selectedMonth;

  int get selectedDay => _selectedDay;

  List<CalendarDate> get calendarDates => _calendarDates;

  void select(int year, int month, int day) {
    _selectedYear = year;
    _selectedMonth = month;
    _selectedDay = day;
    notifyListeners();
  }

  void setCalendarDates() {
    _calendarDates = _calendar.getCalendarForMonth(
        _selectedYear, _selectedMonth,
        startWithSunday: true);
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
