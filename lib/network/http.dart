import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Http {
  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 3 * 60),
    ),
  )..interceptors.add(PrettyDioLogger());

  static Future<Response> get(String url,
      {required Map<String, dynamic> params}) async {
    try {
      final response = await _dio.get(url, queryParameters: params);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> post(String url,
      {required Map<String, dynamic> params, dynamic data}) async {
    try {
      final response = await _dio.post(url,
          queryParameters: params, data: data ?? FormData());
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
