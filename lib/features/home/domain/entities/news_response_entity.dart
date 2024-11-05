class NewsResponseEntity {
  final String status;
  final int totalResults;
  final List<ArticleResponseEntity> articles;

  NewsResponseEntity({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
}

class ArticleResponseEntity {
  final SourceResponseEntity source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ArticleResponseEntity({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
}

class SourceResponseEntity {
  final String? id;
  final String name;

  SourceResponseEntity({
    this.id,
    required this.name,
  });
}
