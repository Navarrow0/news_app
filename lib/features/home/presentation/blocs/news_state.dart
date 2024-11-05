part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  final List<ArticleResponseEntity> newsList;
  const NewsState({required this.newsList});

  @override
  List<Object?> get props => [newsList];
}

class NewsInitial extends NewsState {
  const NewsInitial({required List<ArticleResponseEntity> newsList}) : super(newsList: newsList);
}

class NewsLoading extends NewsState {
  const NewsLoading({required List<ArticleResponseEntity> newsList}) : super(newsList: newsList);
}

class NewsLoaded extends NewsState {
  const NewsLoaded({required List<ArticleResponseEntity> newsList}) : super(newsList: newsList);
}

class NewsError extends NewsState {
  final String message;
  const NewsError({required this.message, required List<ArticleResponseEntity> newsList})
      : super(newsList: newsList);

  @override
  List<Object?> get props => [message, newsList];
}
