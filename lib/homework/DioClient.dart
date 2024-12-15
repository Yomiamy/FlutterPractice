import 'package:dio/dio.dart';

class DioClient {
  late Dio dio;

  DioClient(
      {int connectionTimeout = 30000,
      int receiveTimeout = 30000,
      bool isLogEnabled = true,
      List<InterceptorsWrapper>? interceptWraps}) {
    BaseOptions options = () {
      BaseOptions options = BaseOptions();
      options.connectTimeout = Duration(milliseconds: connectionTimeout);
      options.receiveTimeout = Duration(milliseconds: receiveTimeout);

      return options;
    }();

    this.dio = () {
      Dio dio = Dio(options);

      if (isLogEnabled) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }

      if (interceptWraps != null && interceptWraps.isNotEmpty) {
        dio.interceptors.addAll(interceptWraps);
      }

      return dio;
    }();
  }
}
