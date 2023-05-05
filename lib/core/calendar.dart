import 'package:simple_calendar/models/calendar_date.dart';
import 'package:lunar/lunar.dart';

const daysOfWeek = 7;

class Calendar {
  late int currentYear;
  late int currentMonth;
  late int currentDay;

  Calendar() {
    final now = DateTime.now();

    currentYear = now.year;
    currentMonth = now.month;
    currentDay = now.day;
  }

  List<CalendarDate> getCalendarForMonth(int year, int month, {bool startWithSunday = false}) {
    int daysInMonth = _getDaysInMonth(year, month);
    int firstWeekday = _getWeekday(year, month, 1);
    int lastWeekday = _getWeekday(year, month, daysInMonth);
    int daysFromPreviousMonth = firstWeekday - (startWithSunday ? 0 : 1);
    int daysFromNextMonth = 2 * daysOfWeek - ((startWithSunday ? 1 : 0) + lastWeekday);

    if (daysFromNextMonth < 0) {
      daysFromNextMonth += lastWeekday;
    }

    List<CalendarDate> calendar = [];

    calendar.addAll(_getDaysFromPreviousMonth(year, month, daysFromPreviousMonth));
    calendar.addAll(_getDaysFromCurrentMonth(year, month, daysInMonth, daysFromPreviousMonth, startWithSunday));
    calendar.addAll(_getDaysFromNextMonth(year, month, daysFromNextMonth));

    return calendar;
  }

  int _getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  int _getWeekday(int year, int month, int day) {
    return DateTime(year, month, day).weekday;
  }

  String _getWeekdayAbbreviation(int weekday) {
    const List<String> weekdays = ['一', '二', '三', '四', '五', '六', '日'];
    return weekdays[weekday];
  }

  List<String> getWeekdayHeaders(bool startWithSunday) {
    List<String> headers = [];
    for (int i = 0; i < daysOfWeek; i++) {
      int weekday = i + (startWithSunday ? 6 : 0);
      if (weekday >= daysOfWeek) {
        weekday -= daysOfWeek;
      }
      headers.add(_getWeekdayAbbreviation(weekday));
    }
    return headers;
  }

  List<CalendarDate> _getDaysFromPreviousMonth(int year, int month, int daysFromPreviousMonth) {
    List<CalendarDate> days = [];
    for (int i = 0; i < daysFromPreviousMonth; i++) {
      int day = _getDaysInMonth(year, month - 1) - daysFromPreviousMonth + i + 1;
      days.add(_assembleCalendarDate(year, month - 1, day));
    }
    return days;
  }

  List<CalendarDate> _getDaysFromCurrentMonth(int year, int month, int daysInMonth, int daysFromPreviousMonth, bool startWithSunday) {
    List<CalendarDate> days = [];
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(_assembleCalendarDate(year, month, i));
    }
    return days;
  }

  List<CalendarDate> _getDaysFromNextMonth(int year, int month, int daysFromNextMonth) {
    List<CalendarDate> days = [];
    for (int i = 0; i < daysFromNextMonth; i++) {
      int day = i + 1;

      var nextMonth = month + 1;
      var nextYear = year;

      if (nextMonth > 12) {
        nextMonth = 1;
        nextYear += 1;
      }
      days.add(_assembleCalendarDate(nextYear, nextMonth, day));
    }
    return days;
  }

  List<List<CalendarDate>> _format(List<CalendarDate> calendar) {
    List<List<CalendarDate>> twoDimensionCalendar = [];

    for (int i = 1; i <= calendar.length; i++) {
      if (i % daysOfWeek == 0) {
        twoDimensionCalendar.add(calendar.sublist(i - daysOfWeek, i));
      }
    }

    return twoDimensionCalendar;
  }

  bool isPreviousMonth(int year, int month) {
    if (year == currentYear) {
      return month < currentMonth;
    }

    return year < currentYear;
  }

  bool isNextMonth(int year, int month) {
    if (year == currentYear) {
      return month > currentMonth;
    }

    return year > currentYear;
  }

  bool isToday(int year, int month, int day) {
    return year == currentYear && month == currentMonth && day == currentDay;
  }

  CalendarDate _assembleCalendarDate(int year, int month, int day) {
    Solar solar = Solar.fromYmd(year, month, day);
    Lunar lunar = solar.getLunar();
    Holiday? holiday = HolidayUtil.getHolidayByYmd(year, month, day);

    return CalendarDate(
        date: '$year-$month-$day',
        year: year,
        month: month,
        day: day,
        weekday: _getWeekday(year, month, day),
        constellation: solar.getXingZuo(),
        festivals: solar.getFestivals(),
        lunar: LunarDate(
            date: lunar.toString(),
            year: lunar.getYearInChinese(),
            month: lunar.getMonthInChinese(),
            day: lunar.getDayInChinese(),
            week: lunar.getWeekInChinese(),
            festivals: lunar.getFestivals(),
            chineseZodiac: lunar.getYearShengXiao(),
            solarTerm: lunar.getCurrentJieQi()?.getName(),
            isWork: holiday?.isWork()
        )
    );
  }
}