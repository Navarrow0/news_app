import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/home/domain/entities/news_response_entity.dart';
import 'package:news_app/features/home/domain/usecases/get_news_usecase.dart';

part 'news_event.dart';
part 'news_state.dart';


class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase getNewsUseCase;
  final ScrollController scrollController = ScrollController();
  int currentPage = 1;
  bool isFetching = false;

  NewsBloc({required this.getNewsUseCase}) : super(NewsInitial(newsList: [])) {
    scrollController.addListener(_onScroll);

    on<GetNewsEvent>(_onGetNewsEvent);
    on<RefreshNewsEvent>(_onRefreshNewsEvent);
  }

  void _onScroll() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200 && !isFetching) {
      add(GetNewsEvent(page: currentPage + 1));
    }
  }

  Future<void> _onGetNewsEvent(GetNewsEvent event, Emitter<NewsState> emit) async {
    isFetching = true;
    if (state is NewsLoading) return;
    emit(NewsLoading(newsList: state.newsList));
    final result = await getNewsUseCase(page: event.page);
    result.fold(
          (failure) {
        isFetching = false;
        emit(NewsError(message: failure, newsList: state.newsList));
      },
          (news) {
        isFetching = false;
        currentPage = event.page;
        final updatedNewsList = List<ArticleResponseEntity>.from(state.newsList)
          ..addAll(news.articles);
        emit(NewsLoaded(newsList: updatedNewsList));
      },
    );
  }

  Future<void> _onRefreshNewsEvent(RefreshNewsEvent event, Emitter<NewsState> emit) async {
    currentPage = 1;
    emit(NewsLoading(newsList: []));
    final result = await getNewsUseCase(page: currentPage);
    result.fold(
          (failure) {
        emit(NewsError(message: failure, newsList: []));
      },
          (news) {
        emit(NewsLoaded(newsList: news.articles));
      },
    );
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}

