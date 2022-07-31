import 'package:dio/dio.dart';
import 'package:flutter_base/constants.dart';

abstract class BaseService {
  static final Dio dio = Dio(BaseOptions(baseUrl: baseApiUrl));

  static Future<T> get<T>(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    final response = await dio.get(path, queryParameters: params);

    return response.data;
  }
}
