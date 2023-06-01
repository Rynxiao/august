import 'package:simple_calendar/utils/date_utils.dart';

class SenseType {
  late String id;
  late String title;
  int createTime = 0;

  SenseType({
    required this.id,
    required this.title,
  }) {
    final now = DateTime.now();
    createTime = getTimestamp(now);
  }

  SenseType.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['createTime'] = createTime;
    return map;
  }
}
