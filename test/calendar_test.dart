
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_calendar/calendar.dart';
import 'package:simple_calendar/models/calendar_date.dart';

void main() {
  Calendar calendar = Calendar();

  test('getCalendarForMonth returns calendar for April 2023', () {
    List<List<CalendarDate>> calendarList = calendar.getCalendarForMonth(2023, 5);
    List<String> headers = calendar.getWeekdayHeaders(false);

    expect(headers.join(' '), 'Mon Tue Wed Thu Fri Sat Sun');
  });

  test('getCalendarForMonth returns calendar for April 2023 with Sunday as first day of the week', () {
    List<List<CalendarDate>> calendarList = calendar.getCalendarForMonth(2023, 4, startWithSunday: true);
    List<String> headers = calendar.getWeekdayHeaders(true);

    expect(headers.join(' '), 'Sun Mon Tue Wed Thu Fri Sat');
  });
}