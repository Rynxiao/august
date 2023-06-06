import 'location.dart';
import 'refer.dart';

class WeatherLocation {
  late String code;
  late List<Location> location;
  Refer? refer;

  WeatherLocation({
    required this.code,
    required this.location,
    this.refer,
  });

  WeatherLocation.fromJson(dynamic json) {
    code = json['code'];
    if (json['location'] != null) {
      location = [];
      json['location'].forEach((v) {
        location.add(Location.fromJson(v));
      });
    }
    refer = (json['refer'] != null ? Refer.fromJson(json['refer']) : null)!;
  }



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['location'] = location.map((v) => v.toJson()).toList();
    if (refer != null) {
      map['refer'] = refer?.toJson();
    }
    return map;
  }
}
