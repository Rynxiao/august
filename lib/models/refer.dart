class Refer {
  late List<String> sources;
  late List<String> license;

  Refer({
    required this.sources,
    required this.license,
  });

  Refer.fromJson(dynamic json) {
    sources = json['sources'] != null ? json['sources'].cast<String>() : [];
    license = json['license'] != null ? json['license'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sources'] = sources;
    map['license'] = license;
    return map;
  }
}
