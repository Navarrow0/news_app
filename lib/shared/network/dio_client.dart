import 'package:dio/dio.dart';
import 'package:news_app/shared/exceptions/error_interceptor.dart';
import 'loading_interceptor.dart';

class DioClient {
  final Dio dio;

  DioClient({String? baseUrl, bool loading = false, String token = ''})
      : dio = Dio(BaseOptions(
    baseUrl: baseUrl ?? 'https://newsapi.org/v2/',
    contentType: 'application/json; charset=UTF-8',
    headers: {
      'Accept': 'application/json',
      'Authorization': 'e6a63ef71f2c4f6185a1ab8deaeebafc',
    },
    receiveDataWhenStatusError: true,
    validateStatus: (_) => true,
  )) {
    if (loading) {
      dio.interceptors.add(LoadingInterceptor());
    }
    dio.interceptors.add(ErrorInterceptors(dio));
  }
}
