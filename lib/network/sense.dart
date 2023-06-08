import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/commonSense/common_sense.dart';
import '../models/commonSense/sense_response.dart';
import 'http.dart';

final baseUrl = "${dotenv.env['SENSE_BACKEND_URL']}/api/senses";

Future<List<CommonSense>> getCommonSenseByPage(
    {int page = 1, int pageSize = 20}) async {
  final response = await Http.get(
    "$baseUrl/",
    params: {'page': page, 'pageSize': pageSize},
  );

  return SenseResponse.fromJson(response.data).data;
}

Future<List<CommonSense>> getCommonSenseByTypeId(String typeId) async {
  final response = await Http.get(
    "$baseUrl/types",
    params: {'typeId': typeId},
  );

  return SenseResponse.fromJson(response.data).data;
}

Future<List<CommonSense>> getLikedCommonSenses() async {
  final response = await Http.get("$baseUrl/likes", params: {});
  return SenseResponse.fromJson(response.data).data;
}

Future<bool> makeCommonSenseRead(
    String senseId,
    ) async {
  final response = await Http.post(
    "$baseUrl/update",
    params: {'id': senseId},
    data: jsonEncode({'read': 1}),
  );

  if (response.statusCode == 200) {
    return true;
  }

  return false;
}

Future<bool> addToLikes(
    String senseId,
    int liked,
    ) async {
  final response = await Http.post(
    "$baseUrl/update",
    params: {'id': senseId},
    data: jsonEncode({'liked': liked}),
  );

  if (response.statusCode == 200) {
    return true;
  }

  return false;
}