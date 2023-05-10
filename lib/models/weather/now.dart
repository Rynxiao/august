class Now {
  late String obsTime;
  late String temp;
  late String feelsLike;
  late String icon;
  late String text;
  late String wind360;
  late String windDir;
  late String windScale;
  late String windSpeed;
  late String humidity;
  late String precip;
  late String pressure;
  late String vis;
  late String cloud;
  late String dew;

  Now({
    required this.obsTime,
    required this.temp,
    required this.feelsLike,
    required this.icon,
    required this.text,
    required this.wind360,
    required this.windDir,
    required this.windScale,
    required this.windSpeed,
    required this.humidity,
    required this.precip,
    required this.pressure,
    required this.vis,
    required this.cloud,
    required this.dew,
  });

  Now.fromJson(dynamic json) {
    obsTime = json['obsTime'];
    temp = json['temp'];
    feelsLike = json['feelsLike'];
    icon = json['icon'];
    text = json['text'];
    wind360 = json['wind360'];
    windDir = json['windDir'];
    windScale = json['windScale'];
    windSpeed = json['windSpeed'];
    humidity = json['humidity'];
    precip = json['precip'];
    pressure = json['pressure'];
    vis = json['vis'];
    cloud = json['cloud'];
    dew = json['dew'];
  }

  Now.empty() {
    obsTime = '';
    temp = '';
    feelsLike = '';
    icon = '';
    text = '';
    wind360 = '';
    windDir = '';
    windScale = '';
    windSpeed = '';
    humidity = '';
    precip = '';
    pressure = '';
    vis = '';
    cloud = '';
    dew = '';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['obsTime'] = obsTime;
    map['temp'] = temp;
    map['feelsLike'] = feelsLike;
    map['icon'] = icon;
    map['text'] = text;
    map['wind360'] = wind360;
    map['windDir'] = windDir;
    map['windScale'] = windScale;
    map['windSpeed'] = windSpeed;
    map['humidity'] = humidity;
    map['precip'] = precip;
    map['pressure'] = pressure;
    map['vis'] = vis;
    map['cloud'] = cloud;
    map['dew'] = dew;
    return map;
  }
}
