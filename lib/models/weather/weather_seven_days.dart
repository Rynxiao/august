import 'daily.dart';
import 'refer.dart';

class WeatherSevenDays {
  late String code;
  late String updateTime;
  late String fxLink;
  late List<Daily> daily;
  Refer? refer;

  WeatherSevenDays({
    required this.code,
    required this.updateTime,
    required this.fxLink,
    required this.daily,
    this.refer,
  });

  WeatherSevenDays.fromJson(dynamic json) {
    code = json['code'];
    updateTime = json['updateTime'];
    fxLink = json['fxLink'];
    if (json['daily'] != null) {
      daily = [];
      json['daily'].forEach((v) {
        daily.add(Daily.fromJson(v));
      });
    }
    refer = json['refer'] != null ? Refer.fromJson(json['refer']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['updateTime'] = updateTime;
    map['fxLink'] = fxLink;
    if (daily != null) {
      map['daily'] = daily.map((v) => v.toJson()).toList();
    }
    if (refer != null) {
      map['refer'] = refer?.toJson();
    }
    return map;
  }
}
