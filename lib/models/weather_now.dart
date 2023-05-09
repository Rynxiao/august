import 'now.dart';
import 'refer.dart';

class WeatherNow {
  late String code;
  late String updateTime;
  late String fxLink;
  late Now now;
  Refer? refer;

  WeatherNow({
    required this.code,
    required this.updateTime,
    required this.fxLink,
    required this.now,
    required this.refer,
  });

  WeatherNow.fromJson(dynamic json) {
    code = json['code'];
    updateTime = json['updateTime'];
    fxLink = json['fxLink'];
    now = Now.fromJson(json['now']);
    refer = json['refer'] != null ? Refer.fromJson(json['refer']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['updateTime'] = updateTime;
    map['fxLink'] = fxLink;
    map['now'] = now.toJson();
    if (refer != null) {
      map['refer'] = refer?.toJson();
    }
    return map;
  }
}
