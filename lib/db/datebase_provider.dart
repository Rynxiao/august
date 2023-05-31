import 'package:path/path.dart';
import 'package:simple_calendar/db/calendar.dart';
import 'package:sqflite/sqflite.dart';

import '../utils/logger.dart';
import 'common_sense.dart';

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._();
  static Database? _database;

  DatabaseProvider._();

  factory DatabaseProvider() => _instance;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'august.db');
    Logger.d("database path: $path");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
            CREATE TABLE IF NOT EXISTS ${CalendarDB.calendarEvent} (
              id TEXT,
              dateId TEXT,
              title TEXT,
              content TEXT,
              date INTEGER,
              lunarDate TEXT,
              isCycle INTEGER,
              cycleBy INTEGER,
              createTime INTEGER,
              modifyTime INTEGER,
              deleted INTEGER
            )
          ''');
        await db.execute('''
            CREATE TABLE IF NOT EXISTS ${CommonSenseDB.commonSense} (
              id TEXT,
              title TEXT,
              content TEXT,
              cover TEXT,
              liked INTEGER,
              read INTEGER,
              type INTEGER,
              createTime INTEGER,
              modifyTime INTEGER,
              deleted INTEGER
            )
          ''');
      },
    );
  }
}
