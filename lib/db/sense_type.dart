import 'package:simple_calendar/db/datebase_provider.dart';
import 'package:simple_calendar/models/commonSense/common_sense.dart';
import 'package:simple_calendar/models/commonSense/sense_type.dart';
import 'package:sqflite/sqflite.dart';

import '../models/calendar/calendar_event.dart';
import '../utils/date_utils.dart';

class SenseTypeDB {
  static const String senseType = 'sense_type';

  static Future<Database> getDatabase() async {
    return await DatabaseProvider().database;
  }

  static Future<List<SenseType>> getAllSenseType() async {
    final db = await getDatabase();
    var senseTypes = await db.query(senseType);
    return senseTypes.map((event) => SenseType.fromJson(event)).toList();
  }
}
