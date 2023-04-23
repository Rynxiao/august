const daysOfWeek = 7;

class Calendar {

  Calendar();

  List<List<String>> getCalendarForMonth(int year, int month, {bool startWithSunday = false}) {
    int daysInMonth = _getDaysInMonth(year, month);
    int firstWeekday = _getWeekday(year, month, 1);
    int lastWeekday = _getWeekday(year, month, daysInMonth);
    int daysFromPreviousMonth = firstWeekday - (startWithSunday ? 0 : 1);
    int daysFromNextMonth = 2 * daysOfWeek - ((startWithSunday ? 1 : 0) + lastWeekday);

    if (daysFromNextMonth < 0) {
      daysFromNextMonth += lastWeekday;
    }

    int totalDays = daysInMonth + daysFromPreviousMonth + daysFromNextMonth;

    List<String> calendar = [];

    calendar.addAll(_getWeekdayHeaders(startWithSunday));
    calendar.addAll(_getDaysFromPreviousMonth(year, month, daysFromPreviousMonth));
    calendar.addAll(_getDaysFromCurrentMonth(year, month, daysInMonth, daysFromPreviousMonth, startWithSunday));
    calendar.addAll(_getDaysFromNextMonth(year, month, daysFromNextMonth));

    return _format(calendar);
  }

  int _getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  int _getWeekday(int year, int month, int day) {
    return DateTime(year, month, day).weekday;
  }

  String _getWeekdayAbbreviation(int weekday) {
    const List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekdays[weekday];
  }

  List<String> _getWeekdayHeaders(bool startWithSunday) {
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

  List<String> _getDaysFromPreviousMonth(int year, int month, int daysFromPreviousMonth) {
    List<String> days = [];
    for (int i = 0; i < daysFromPreviousMonth; i++) {
      int day = _getDaysInMonth(year, month - 1) - daysFromPreviousMonth + i + 1;
      days.add('$day');
    }
    return days;
  }

  List<String> _getDaysFromCurrentMonth(int year, int month, int daysInMonth, int daysFromPreviousMonth, bool startWithSunday) {
    List<String> days = [];
    for (int i = 1; i <= daysInMonth; i++) {
      days.add('$i');
    }
    return days;
  }

  List<String> _getDaysFromNextMonth(int year, int month, int daysFromNextMonth) {
    List<String> days = [];
    for (int i = 0; i < daysFromNextMonth; i++) {
      int day = i + 1;
      days.add('$day');
    }
    return days;
  }

  List<List<String>> _format(List<String> calendar) {
    List<List<String>> twoDimensionCalendar = [];

    for(int i = 1; i <= calendar.length; i++) {
      if (i % daysOfWeek == 0) {
        twoDimensionCalendar.add(calendar.sublist(i - daysOfWeek, i));
      }
    }

    return twoDimensionCalendar;
  }
}