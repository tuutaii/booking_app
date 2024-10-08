// YOUR_FILE.dart

import "dart:async";
import 'package:chopper/chopper.dart';

// This is necessary for the generator to work.
part "api_service.chopper.dart";

@ChopperApi(
    baseUrl: 'https://eecf8975-6c57-4990-969b-6a32dc2c0aff.mock.pstmn.io')
abstract class HotelsService extends ChopperService {
  static HotelsService create() {
    final client = ChopperClient(
        services: [_$HotelsService()],
        converter: const JsonConverter(),
        interceptors: [CurlInterceptor()]);
    return _$HotelsService(client);
  }

  @Get(path: '/hotels')
  Future<Response> getHotels();
}

@ChopperApi(baseUrl: 'https://freetestapi.com/api/v1')
abstract class UserService extends ChopperService {
  static UserService create() {
    final client = ChopperClient(
        services: [_$UserService()],
        converter: const JsonConverter(),
        interceptors: [CurlInterceptor()]);
    return _$UserService(client);
  }

  @Get(path: '/users/1')
  Future<Response> getUser();
}
