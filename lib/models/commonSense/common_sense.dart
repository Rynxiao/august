import 'package:simple_calendar/utils/date_utils.dart';

class CommonSense {
  late String id;
  late String title;
  late String content;
  String cover = '';
  int liked = 0;  // 0: 没有收藏，1: 收藏
  int read = 0;   // 0: 未读，1: 已读
  int type = 0;   // 0: 其他，1: 医学
  int createTime = 0;
  int modifyTime = 0;
  int deleted = 0;

  CommonSense({
    required this.id,
    required this.title,
    required this.content,
    required this.cover,
  }) {
    final now = DateTime.now();
    createTime = getTimestamp(now);
    modifyTime = createTime;
  }

  CommonSense.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    cover = json['cover'];
    liked = json['liked'];
    read = json['read'];
    type = json['type'];
    createTime = json['createTime'];
    modifyTime = json['modifyTime'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['content'] = content;
    map['cover'] = cover;
    map['liked'] = liked;
    map['read'] = read;
    map['type'] = type;
    map['createTime'] = createTime;
    map['modifyTime'] = modifyTime;
    map['deleted'] = deleted;
    return map;
  }
}
