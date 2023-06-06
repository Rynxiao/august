class Meta {
  late String page;
  late String total;

  Meta({
    required this.page,
    required this.total,
  });

  Meta.fromJson(dynamic json) {
    page = json['page'].toString();
    total = json['total'].toString();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['total'] = total;
    return map;
  }
}
