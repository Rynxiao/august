
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_calendar/calendar.dart';

void main() {
  Calendar calendar = Calendar();

  test('getCalendarForMonth returns calendar for April 2023', () {
    List<List<String>> calendarList = calendar.getCalendarForMonth(2023, 4);

    expect(calendarList[0].join(' '), 'Mon Tue Wed Thu Fri Sat Sun');
    expect(calendarList[1].join(' '), '27 28 29 30 31 1 2');
    expect(calendarList[2].join(' '), '3 4 5 6 7 8 9');
    expect(calendarList[3].join(' '), '10 11 12 13 14 15 16');
    expect(calendarList[4].join(' '), '17 18 19 20 21 22 23');
    expect(calendarList[5].join(' '), '24 25 26 27 28 29 30');
    expect(calendarList[6].join(' '), '1 2 3 4 5 6 7');
  });

  test('getCalendarForMonth returns calendar for April 2023 with Sunday as first day of the week', () {
    List<List<String>> calendarList = calendar.getCalendarForMonth(2023, 4, startWithSunday: true);

    expect(calendarList[0].join(' '), 'Sun Mon Tue Wed Thu Fri Sat');
    expect(calendarList[1].join(' '), '26 27 28 29 30 31 1');
    expect(calendarList[2].join(' '), '2 3 4 5 6 7 8');
    expect(calendarList[3].join(' '), '9 10 11 12 13 14 15');
    expect(calendarList[4].join(' '), '16 17 18 19 20 21 22');
    expect(calendarList[5].join(' '), '23 24 25 26 27 28 29');
    expect(calendarList[6].join(' '), '30 1 2 3 4 5 6');
  });

  test('getCalendarForMonth returns calendar for February 2024 with Sunday as first day of the week', () {
    List<List<String>> calendarList = calendar.getCalendarForMonth(2024, 2, startWithSunday: true);

    expect(calendarList[0].join(' '), 'Sun Mon Tue Wed Thu Fri Sat');
    expect(calendarList[1].join(' '), '28 29 30 31 1 2 3');
    expect(calendarList[2].join(' '), '4 5 6 7 8 9 10');
    expect(calendarList[3].join(' '), '11 12 13 14 15 16 17');
    expect(calendarList[4].join(' '), '18 19 20 21 22 23 24');
    expect(calendarList[5].join(' '), '25 26 27 28 29 1 2');
    expect(calendarList[6].join(' '), '3 4 5 6 7 8 9');
  });

  test('getCalendarForMonth returns calendar for December 2022 with Sunday as first day of the week', () {
    List<List<String>> calendarList = calendar.getCalendarForMonth(2022, 12, startWithSunday: true);

    expect(calendarList[0].join(' '), 'Sun Mon Tue Wed Thu Fri Sat');
    expect(calendarList[1].join(' '), '27 28 29 30 1 2 3');
    expect(calendarList[2].join(' '), '4 5 6 7 8 9 10');
    expect(calendarList[3].join(' '), '11 12 13 14 15 16 17');
    expect(calendarList[4].join(' '), '18 19 20 21 22 23 24');
    expect(calendarList[5].join(' '), '25 26 27 28 29 30 31');
    expect(calendarList[6].join(' '), '1 2 3 4 5 6 7');
  });

  test('getCalendarForMonth returns calendar for March 2023 with Sunday as first day of the week', () {
    List<List<String>> calendarList = calendar.getCalendarForMonth(2023, 9, startWithSunday: true);

    expect(calendarList[0].join(' '), 'Sun Mon Tue Wed Thu Fri Sat');
    expect(calendarList[1].join(' '), '27 28 29 30 31 1 2');
    expect(calendarList[2].join(' '), '3 4 5 6 7 8 9');
    expect(calendarList[3].join(' '), '10 11 12 13 14 15 16');
    expect(calendarList[4].join(' '), '17 18 19 20 21 22 23');
    expect(calendarList[5].join(' '), '24 25 26 27 28 29 30');
    expect(calendarList[6].join(' '), '1 2 3 4 5 6 7');
  });
}