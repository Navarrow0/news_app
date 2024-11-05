import 'package:dartz/dartz.dart';
import 'package:news_app/features/home/domain/entities/news_response_entity.dart';
import '../repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase(this.repository);

  Future<Either<String, NewsResponseEntity>> call({required int page}) {
    return repository.getNews(page: page);
  }
}
