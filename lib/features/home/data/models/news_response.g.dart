// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsResponseModelImpl _$$NewsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsResponseModelImpl(
      status: json['status'] as String,
      totalResults: (json['totalResults'] as num).toInt(),
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NewsResponseModelImplToJson(
        _$NewsResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

_$ArticleModelImpl _$$ArticleModelImplFromJson(Map<String, dynamic> json) =>
    _$ArticleModelImpl(
      source: SourceModel.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String? ?? '',
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String? ??
          'https://via.assets.so/img.jpg?w=1280&h=720&tc=grey&bg=#cecece',
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$$ArticleModelImplToJson(_$ArticleModelImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };

_$SourceModelImpl _$$SourceModelImplFromJson(Map<String, dynamic> json) =>
    _$SourceModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$SourceModelImplToJson(_$SourceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
