import 'package:simple_calendar/utils/date_utils.dart';

class SenseType {
  late String id;
  late String title;
  String createdAt = '';
  String updatedAt = '';

  SenseType({
    required this.id,
    required this.title,
  }) {
    final now = DateTime.now();
    createdAt = now.toLocal().toString();
    updatedAt = updatedAt;
  }

  SenseType.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
