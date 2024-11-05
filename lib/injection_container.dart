import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app/features/home/data/datasource/news_remote_datasource.dart';
import 'package:news_app/features/home/data/repositories/news_repository_impl.dart';
import 'package:news_app/features/home/domain/repositories/news_repository.dart';
import 'package:news_app/features/home/domain/usecases/get_news_usecase.dart';
import 'package:news_app/features/home/presentation/blocs/news_bloc.dart';
import 'package:news_app/shared/network/dio_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(
        () => NewsBloc(getNewsUseCase: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetNewsUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<NewsRepository>(
        () => NewsRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<NewsRemoteDataSource>(
        () => NewsRemoteDataSource(sl()),
  );

  // Network
  sl.registerLazySingleton<Dio>(
        () => DioClient().dio,
  );
}
