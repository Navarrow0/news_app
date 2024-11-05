import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/presentation/blocs/news_bloc.dart';
import 'package:news_app/injection_container.dart';
import 'package:news_app/features/home/presentation/widgets/article_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewsBloc>()..add(GetNewsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Noticias de México'),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsInitial ||
                state is NewsLoading && state.newsList.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else if (state is NewsLoaded ||
                state is NewsLoading && state.newsList.isNotEmpty) {
              final articles = state.newsList;
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<NewsBloc>().add(RefreshNewsEvent());
                },
                child: ListView.builder(
                  controller: context.read<NewsBloc>().scrollController,
                  itemCount: articles.length + 1,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index < articles.length) {
                      final article = articles[index];
                      return ArticleListItem(article: article);
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Center(
                          child: state is NewsLoading
                              ? CircularProgressIndicator()
                              : SizedBox.shrink(),
                        ),
                      );
                    }
                  },
                ),
              );
            } else if (state is NewsError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
