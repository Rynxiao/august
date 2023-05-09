class Hourly {
  late String fxTime;
  late String temp;
  late String icon;
  late String text;
  late String wind360;
  late String windDir;
  late String windScale;
  late String windSpeed;
  late String humidity;
  late String pop;
  late String precip;
  late String pressure;
  late String cloud;
  late String dew;

  Hourly({
    required this.fxTime,
    required this.temp,
    required this.icon,
    required this.text,
    required this.wind360,
    required this.windDir,
    required this.windScale,
    required this.windSpeed,
    required this.humidity,
    required this.pop,
    required this.precip,
    required this.pressure,
    required this.cloud,
    required this.dew,
  });

  Hourly.fromJson(dynamic json) {
    fxTime = json['fxTime'];
    temp = json['temp'];
    icon = json['icon'];
    text = json['text'];
    wind360 = json['wind360'];
    windDir = json['windDir'];
    windScale = json['windScale'];
    windSpeed = json['windSpeed'];
    humidity = json['humidity'];
    pop = json['pop'];
    precip = json['precip'];
    pressure = json['pressure'];
    cloud = json['cloud'];
    dew = json['dew'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fxTime'] = fxTime;
    map['temp'] = temp;
    map['icon'] = icon;
    map['text'] = text;
    map['wind360'] = wind360;
    map['windDir'] = windDir;
    map['windScale'] = windScale;
    map['windSpeed'] = windSpeed;
    map['humidity'] = humidity;
    map['pop'] = pop;
    map['precip'] = precip;
    map['pressure'] = pressure;
    map['cloud'] = cloud;
    map['dew'] = dew;
    return map;
  }
}
