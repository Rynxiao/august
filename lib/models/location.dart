class Location {
  late String name;
  late String id;
  late String lat;
  late String lon;
  late String adm2;
  late String adm1;
  late String country;
  late String tz;
  late String utcOffset;
  late String isDst;
  late String type;
  late String rank;
  late String fxLink;

  Location({
    required this.name,
    required this.id,
    required this.lat,
    required this.lon,
    required this.adm2,
    required this.adm1,
    required this.country,
    required this.tz,
    required this.utcOffset,
    required this.isDst,
    required this.type,
    required this.rank,
    required this.fxLink,
  });

  Location.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    lat = json['lat'];
    lon = json['lon'];
    adm2 = json['adm2'];
    adm1 = json['adm1'];
    country = json['country'];
    tz = json['tz'];
    utcOffset = json['utcOffset'];
    isDst = json['isDst'];
    type = json['type'];
    rank = json['rank'];
    fxLink = json['fxLink'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['lat'] = lat;
    map['lon'] = lon;
    map['adm2'] = adm2;
    map['adm1'] = adm1;
    map['country'] = country;
    map['tz'] = tz;
    map['utcOffset'] = utcOffset;
    map['isDst'] = isDst;
    map['type'] = type;
    map['rank'] = rank;
    map['fxLink'] = fxLink;
    return map;
  }
}
