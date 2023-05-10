import 'hourly.dart';
import 'refer.dart';

class WeatherTwentyFourHours {
  late String code;
  late String updateTime;
  late String fxLink;
  late List<Hourly> hourly;
  Refer? refer;

  WeatherTwentyFourHours({
    required this.code,
    required this.updateTime,
    required this.fxLink,
    required this.hourly,
    required this.refer,
  });

  WeatherTwentyFourHours.fromJson(dynamic json) {
    code = json['code'];
    updateTime = json['updateTime'];
    fxLink = json['fxLink'];
    if (json['hourly'] != null) {
      hourly = [];
      json['hourly'].forEach((v) {
        hourly.add(Hourly.fromJson(v));
      });
    }
    refer = json['refer'] != null ? Refer.fromJson(json['refer']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['updateTime'] = updateTime;
    map['fxLink'] = fxLink;
    if (hourly != null) {
      map['hourly'] = hourly.map((v) => v.toJson()).toList();
    }
    if (refer != null) {
      map['refer'] = refer?.toJson();
    }
    return map;
  }
}
