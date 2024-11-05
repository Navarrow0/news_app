part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class GetNewsEvent extends NewsEvent {
  final int page;

  const GetNewsEvent({ this.page = 1});

  @override
  List<Object?> get props => [page];
}

class RefreshNewsEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}
