class Daily {
  late String fxDate;
  late String sunrise;
  late String sunset;
  late String moonrise;
  late String moonset;
  late String moonPhase;
  late String moonPhaseIcon;
  late String tempMax;
  late String tempMin;
  late String iconDay;
  late String textDay;
  late String iconNight;
  late String textNight;
  late String wind360Day;
  late String windDirDay;
  late String windScaleDay;
  late String windSpeedDay;
  late String wind360Night;
  late String windDirNight;
  late String windScaleNight;
  late String windSpeedNight;
  late String humidity;
  late String precip;
  late String pressure;
  late String vis;
  late String cloud;
  late String uvIndex;

  Daily({
    required this.fxDate,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonPhaseIcon,
    required this.tempMax,
    required this.tempMin,
    required this.iconDay,
    required this.textDay,
    required this.iconNight,
    required this.textNight,
    required this.wind360Day,
    required this.windDirDay,
    required this.windScaleDay,
    required this.windSpeedDay,
    required this.wind360Night,
    required this.windDirNight,
    required this.windScaleNight,
    required this.windSpeedNight,
    required this.humidity,
    required this.precip,
    required this.pressure,
    required this.vis,
    required this.cloud,
    required this.uvIndex,
  });

  Daily.fromJson(dynamic json) {
    fxDate = json['fxDate'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moonPhase'];
    moonPhaseIcon = json['moonPhaseIcon'];
    tempMax = json['tempMax'];
    tempMin = json['tempMin'];
    iconDay = json['iconDay'];
    textDay = json['textDay'];
    iconNight = json['iconNight'];
    textNight = json['textNight'];
    wind360Day = json['wind360Day'];
    windDirDay = json['windDirDay'];
    windScaleDay = json['windScaleDay'];
    windSpeedDay = json['windSpeedDay'];
    wind360Night = json['wind360Night'];
    windDirNight = json['windDirNight'];
    windScaleNight = json['windScaleNight'];
    windSpeedNight = json['windSpeedNight'];
    humidity = json['humidity'];
    precip = json['precip'];
    pressure = json['pressure'];
    vis = json['vis'];
    cloud = json['cloud'];
    uvIndex = json['uvIndex'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fxDate'] = fxDate;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['moonrise'] = moonrise;
    map['moonset'] = moonset;
    map['moonPhase'] = moonPhase;
    map['moonPhaseIcon'] = moonPhaseIcon;
    map['tempMax'] = tempMax;
    map['tempMin'] = tempMin;
    map['iconDay'] = iconDay;
    map['textDay'] = textDay;
    map['iconNight'] = iconNight;
    map['textNight'] = textNight;
    map['wind360Day'] = wind360Day;
    map['windDirDay'] = windDirDay;
    map['windScaleDay'] = windScaleDay;
    map['windSpeedDay'] = windSpeedDay;
    map['wind360Night'] = wind360Night;
    map['windDirNight'] = windDirNight;
    map['windScaleNight'] = windScaleNight;
    map['windSpeedNight'] = windSpeedNight;
    map['humidity'] = humidity;
    map['precip'] = precip;
    map['pressure'] = pressure;
    map['vis'] = vis;
    map['cloud'] = cloud;
    map['uvIndex'] = uvIndex;
    return map;
  }
}
