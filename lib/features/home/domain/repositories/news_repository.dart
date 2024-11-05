import 'package:dartz/dartz.dart';
import 'package:news_app/features/home/domain/entities/news_response_entity.dart';

abstract class NewsRepository {
  Future<Either<String, NewsResponseEntity>> getNews({required int page});
}
