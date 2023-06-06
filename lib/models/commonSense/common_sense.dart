class CommonSense {
  late String id;
  late String title;
  late String content;
  String cover = '';
  int liked = 0;  // 0: 没有收藏，1: 收藏
  int read = 0;   // 0: 未读，1: 已读
  String type = '0';   // 0: 其他，1: 医学
  String createdAt = '';
  String updatedAt = '';

  CommonSense({
    required this.id,
    required this.title,
    required this.content,
    required this.cover,
  }) {
    final now = DateTime.now();
    createdAt = now.toLocal().toString();
    updatedAt = updatedAt;
  }

  CommonSense.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    cover = json['cover'];
    liked = json['liked'];
    read = json['read'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
