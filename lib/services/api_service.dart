import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ))..interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));

  static Future<Response> getHotels() {
    return _dio.get('https://eecf8975-6c57-4990-969b-6a32dc2c0aff.mock.pstmn.io/hotels');
  }

  static Future<Response> getUser() {
    return _dio.get('https://freetestapi.com/api/v1/users/1');
  }
}
