import 'package:simple_calendar/utils/date_utils.dart';

class CalendarEvent {
  late String id;
  late String dateId;
  late String title;
  late String content;
  late int date;
  late String lunarDate;
  int isCycle = 1; // 0: 不循环，1: 循环
  int cycleBy = 0; // 0: 公历，1: 农历
  int? createTime;
  int? modifyTime;
  int deleted = 0;

  CalendarEvent({
    required this.id,
    required this.dateId,
    required this.title,
    required this.content,
    required this.date,
    required this.lunarDate,
    this.isCycle = 0,
    this.cycleBy = 0,
    this.createTime,
    this.modifyTime,
    this.deleted = 0,
  }) {
    final now = DateTime.now();
    createTime = getTimestamp(now);
    modifyTime = createTime;
  }

  CalendarEvent.fromJson(dynamic json) {
    id = json['id'];
    dateId = json['dateId'];
    title = json['title'];
    content = json['content'];
    date = json['date'];
    lunarDate = json['lunarDate'];
    isCycle = json['isCycle'];
    cycleBy = json['cycleBy'];
    createTime = json['createTime'];
    modifyTime = json['modifyTime'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['dateId'] = dateId;
    map['title'] = title;
    map['content'] = content;
    map['date'] = date;
    map['lunarDate'] = lunarDate;
    map['isCycle'] = isCycle;
    map['cycleBy'] = cycleBy;
    map['createTime'] = createTime;
    map['modifyTime'] = modifyTime;
    map['deleted'] = deleted;
    return map;
  }
}
