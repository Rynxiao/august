import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simple_calendar/models/commonSense/sense_type.dart';
import 'package:simple_calendar/models/commonSense/type_response.dart';

import 'http.dart';

final baseUrl = "${dotenv.env['SENSE_BACKEND_URL']}/api/types";

Future<List<SenseType>> getSenseTypeByPage(
    {int page = 1, int pageSize = 20}) async {
  final response =
  await Http.get("$baseUrl/", params: {'page': page, 'pageSize': pageSize});
  return TypeResponse.fromJson(response.data).data;
}