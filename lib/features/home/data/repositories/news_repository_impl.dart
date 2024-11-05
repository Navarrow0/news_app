import 'package:dartz/dartz.dart';
import 'package:news_app/features/home/data/datasource/news_remote_datasource.dart';
import 'package:news_app/features/home/data/models/news_response.dart';
import 'package:news_app/features/home/domain/entities/news_response_entity.dart';
import 'package:news_app/features/home/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, NewsResponseEntity>> getNews({required int page}) async {
    final result = await remoteDataSource.getNews(page: page);
    return result.fold(
          (failure) => Left(failure),
          (newsModel) => Right(newsModel.toEntity()),
    );
  }
}
