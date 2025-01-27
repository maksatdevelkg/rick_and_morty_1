import 'package:dio/dio.dart';

class DioSetting {
  final Dio dio;

  DioSetting()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'https://rickandmortyapi.com/api/',
            connectTimeout: const Duration(milliseconds: 10000),
            sendTimeout: const Duration(milliseconds: 10000),
            receiveTimeout: const Duration(milliseconds: 10000),
          ),
        ) {
    _addInterceptors();
  }

  void _addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          print('Request: Method ${options.method}, ${options.uri}');
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          print(
              'Response: Status code ${response.statusCode},data => ${response.data}');
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          print('Error: ${error.error},${error.message}');
          return handler.next(error);
        },
      ),
    );
  }
}
