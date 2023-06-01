import 'package:flutter/foundation.dart';
import 'package:simple_calendar/core/calendar_grid_utils.dart';

import '../core/calendar.dart';
import '../db/calendar.dart';
import '../models/calendar/calendar_date.dart';
import '../models/calendar/calendar_event.dart';

class CalendarState extends ChangeNotifier {
  int _selectedYear = 1970;
  int _selectedMonth = 1;
  int _selectedDay = 1;
  late List<CalendarDate> _calendarDates;
  late List<CalendarDate> _prevCalendarDates;
  late List<CalendarDate> _nextCalendarDates;
  List<CalendarEvent> _dateEvents = [];
  final Calendar _calendar = Calendar();

  CalendarState() {
    final now = DateTime.now();
    setSelectedYMD(now.year, now.month, now.day);
    setCalendarDates(now.year, now.month);
  }

  int get selectedYear => _selectedYear;

  int get selectedMonth => _selectedMonth;

  int get selectedDay => _selectedDay;

  Calendar get calendar => _calendar;

  List<CalendarDate> get calendarDates => _calendarDates;

  List<CalendarDate> get prevCalendarDates => _prevCalendarDates;

  List<CalendarDate> get nextCalendarDates => _nextCalendarDates;

  List<CalendarEvent> get dateEvents => _dateEvents;

  Future<void> setDateEvents({int? month}) async {
    List<CalendarEvent> dateEvents =
        await CalendarDB.getEventsByPeriod(month ?? _selectedMonth);
    _dateEvents = dateEvents;
    notifyListeners();
  }

  void select(int year, int month, int day) {
    if (isPreviousMonth(year, month) || isNextMonth(year, month)) {
      setCalendarDates(year, month);
      setDateEvents(month: month);
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

    final prevYearAndMonth = getPrevYearAndMonth(year, month);
    _prevCalendarDates = _calendar.getCalendarForMonth(
        prevYearAndMonth.year, prevYearAndMonth.month,
        startWithSunday: true);

    final nextYearAndMonth = getNextYearAndMonth(year, month);
    _nextCalendarDates = _calendar.getCalendarForMonth(
        nextYearAndMonth.year, nextYearAndMonth.month,
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
