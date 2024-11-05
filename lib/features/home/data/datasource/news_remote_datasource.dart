import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/features/home/data/models/news_response.dart';
import 'package:news_app/shared/network/response_handler.dart';

class NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSource(this.dio);

  Future<Either<String, NewsResponseModel>> getNews({required int page}) async {
    try {
      final response = await dio.get('everything', queryParameters: {
        'q': 'mexico',
        'language': 'es',
        'page': page,
        'pageSize': 15
      });

      return ResponseHandler.handle(
        response,
            (json) => NewsResponseModel.fromJson(json),
      );
    } catch (e) {
      return Left('Exception: $e');
    }
  }
}
