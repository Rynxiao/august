import 'package:simple_calendar/models/commonSense/common_sense.dart';

import 'meta.dart';

class SenseResponse {
  late List<CommonSense> data;
  late Meta meta;


  SenseResponse({
    required this.data,
    required this.meta,
  });

  SenseResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(CommonSense.fromJson(v));
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
