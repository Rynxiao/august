import 'package:simple_calendar/db/datebase_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/calendar/calendar_event.dart';
import '../utils/date_utils.dart';

class CalendarDB {
  static const String calendarEvent = 'calendar_event';

  static Future<Database> getDatabase() async {
    return await DatabaseProvider().database;
  }

  static Future<List<CalendarEvent>> getEvents() async {
    final db = await getDatabase();
    var events = await db.query(calendarEvent);
    return events.map((event) => CalendarEvent.fromJson(event)).toList();
  }

  static Future<CalendarEvent?> getEventsById(String id) async {
    final db = await getDatabase();
    var events = await db.query(
      calendarEvent,
      where: 'id = ?',
      whereArgs: [id],
      orderBy: 'createTime',
    );
    var calendarEvents =
        events.map((event) => CalendarEvent.fromJson(event)).toList();
    return calendarEvents.isNotEmpty ? calendarEvents[0] : null;
  }

  static Future<List<CalendarEvent>> getEventsByDateId(String dateId) async {
    final db = await getDatabase();
    var events = await db.query(
      calendarEvent,
      where: 'dateId = ?',
      whereArgs: [dateId],
      orderBy: 'createTime',
    );
    return events.map((event) => CalendarEvent.fromJson(event)).toList();
  }

  static Future<List<CalendarEvent>> getEventsByPeriod(int month) async {
    int prevMonth = month - 1 <= 0 ? 12 : month - 1;
    int nextMonth = month + 1 >= 12 ? 1 : month + 1;

    final db = await getDatabase();
    var events = await db.query(
      calendarEvent,
      where: 'dateId LIKE ? OR dateId LIKE ? OR dateId LIKE ?',
      whereArgs: [
        '%${formatNumber(prevMonth)}%',
        '%${formatNumber(month)}%',
        '%${formatNumber(nextMonth)}%'
      ],
      orderBy: 'createTime',
    );
    return events.map((event) => CalendarEvent.fromJson(event)).toList();
  }

  static Future<bool> createEvent(CalendarEvent event) async {
    final db = await getDatabase();
    var index = await db.insert(calendarEvent, event.toJson());
    return index > 0;
  }

  static Future<bool> deleteEventById(String id) async {
    final db = await getDatabase();
    var index = await db.delete(
      calendarEvent,
      where: 'id = ?',
      whereArgs: [id],
    );
    return index > 0;
  }

  static Future<bool> updateEvent(CalendarEvent event) async {
    final db = await getDatabase();
    int change = await db.update(
      calendarEvent,
      event.toJson(),
      where: 'id = ?',
      whereArgs: [event.id],
    );
    return change > 0;
  }
}
