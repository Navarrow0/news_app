import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/home/domain/entities/news_response_entity.dart';

class ArticleDetailScreen extends StatelessWidget {
  final ArticleResponseEntity article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage.isNotEmpty)
              Hero(
                tag: 'articleImage_${article.url}',
                child: Image.network(
                  article.urlToImage,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image_not_supported);
                  },
                ),
              ),
            SizedBox(height: 16.0),
            Text(
              article.title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Por ${article.author != null && article.author!.isNotEmpty ? article.author : 'Autor desconocido'}',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              article.publishedAt,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              article.content.isNotEmpty ? article.content : article.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _launchURL(article.url);

                },
                child: Text('Leer artículo completo'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    await EasyLauncher.url(
        url: "https://www.instagram.com/qasim.dev",
        mode: Mode.platformDefault);
  }
}
