import 'package:simple_calendar/models/commonSense/sense_type.dart';

import 'meta.dart';

class TypeResponse {
  late List<SenseType> data;
  late Meta meta;

  TypeResponse({
    required this.data,
    required this.meta,
  });

  TypeResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(SenseType.fromJson(v));
      });
    }
    meta = (json['meta'] != null ? Meta.fromJson(json['meta']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data.map((v) => v.toJson()).toList();
    map['meta'] = meta.toJson();
    return map;
  }
}
