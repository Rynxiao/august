import 'package:simple_calendar/db/datebase_provider.dart';
import 'package:simple_calendar/models/commonSense/common_sense.dart';
import 'package:sqflite/sqflite.dart';

import '../utils/date_utils.dart';

class CommonSenseDB {
  static const String commonSense = 'common_sense';

  static Future<Database> getDatabase() async {
    return await DatabaseProvider().database;
  }

  static Future<List<CommonSense>> getAllCommonSense(
      {int pageSize = 20}) async {
    final db = await getDatabase();
    var commonSenses = await db.query(
      commonSense,
      limit: pageSize,
      orderBy: 'modifyTime asc',
    );
    return commonSenses.map((event) => CommonSense.fromJson(event)).toList();
  }

  static Future<CommonSense?> getCommonSenseById(String id) async {
    final db = await getDatabase();
    var senses = await db.query(
      commonSense,
      where: 'id = ?',
      whereArgs: [id],
      orderBy: 'createTime',
    );
    var commonSenses =
        senses.map((sense) => CommonSense.fromJson(sense)).toList();
    return commonSenses.isNotEmpty ? commonSenses[0] : null;
  }

  static Future<List<CommonSense>> getCommonSenseByTypeId(
      String typeId) async {
    final db = await getDatabase();
    var senses = await db.query(
      commonSense,
      where: 'type = ?',
      whereArgs: [typeId],
      orderBy: 'createTime',
    );
    return senses.map((sense) => CommonSense.fromJson(sense)).toList();
  }

  static Future<List<CommonSense>> getLikedCommonSenses() async {
    final db = await getDatabase();
    var commonSenses = await db.query(
      commonSense,
      where: 'liked = 1',
      orderBy: 'createTime',
    );
    return commonSenses.map((event) => CommonSense.fromJson(event)).toList();
  }

  static Future<bool> makeCommonSenseRead(String senseId) async {
    final db = await getDatabase();
    var sense = await getCommonSenseById(senseId);
    if (sense != null) {
      sense.read = 1;
      sense.modifyTime = getTimestamp(DateTime.now());

      int change = await db.update(
        commonSense,
        sense.toJson(),
        where: 'id = ?',
        whereArgs: [senseId],
      );
      return change > 0;
    }
    return false;
  }
}
