import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/features/home/domain/entities/news_response_entity.dart';


part 'news_response.freezed.dart';
part 'news_response.g.dart';

@freezed
class NewsResponseModel with _$NewsResponseModel {
  const factory NewsResponseModel({
    required String status,
    required int totalResults,
    required List<ArticleModel> articles,
  }) = _NewsResponseModel;

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseModelFromJson(json);
}

@freezed
class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    required SourceModel source,
    @Default('') String author,
    required String title,
    @Default('') String description,
    required String url,
    @Default('https://via.assets.so/img.jpg?w=1280&h=720&tc=grey&bg=#cecece') String urlToImage,
    required String publishedAt,
    @Default('') String content,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}

@freezed
class SourceModel with _$SourceModel {
  const factory SourceModel({
    String? id,
    required String name,
  }) = _SourceModel;

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);
}

extension NewsResponseModelX on NewsResponseModel {
  NewsResponseEntity toEntity() {
    return NewsResponseEntity(
      status: status,
      totalResults: totalResults,
      articles: articles.map((e) => e.toEntity()).toList(),
    );
  }
}

extension ArticleModelX on ArticleModel {
  ArticleResponseEntity toEntity() {
    return ArticleResponseEntity(
      source: source.toEntity(),
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }
}

extension SourceModelX on SourceModel {
  SourceResponseEntity toEntity() {
    return SourceResponseEntity(
      id: id,
      name: name,
    );
  }
}
