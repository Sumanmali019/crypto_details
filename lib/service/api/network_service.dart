import 'package:dio/dio.dart';

class NetworkService {
  final Dio _dio = Dio();

  Future<Response> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<Response> getCoinById(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } on DioError catch (e) {
      throw e.message;
    }
  }
}
