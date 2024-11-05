import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/config/app_route_names.dart';
import 'package:news_app/features/home/domain/entities/news_response_entity.dart';
import 'package:news_app/shared/utils/date_formatter.dart';

class ArticleListItem extends StatelessWidget {
  final ArticleResponseEntity article;

  const ArticleListItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormatter.format(article.publishedAt);

    return InkWell(
      onTap: () {
        context.goNamed(
          AppRouteNames.articleDetaill.name,
          extra: article,
        );
      },
      child: Padding(
        padding: EdgeInsets.all(context.i(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.urlToImage.isNotEmpty
                ? ClipRRect(
              borderRadius: BorderRadius.circular(context.r(8)),
              child: Image.network(
                article.urlToImage,
                width: context.w(60),
                height: context.h(60),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image_not_supported);
                },
              ),
            )
                : Icon(Icons.image_not_supported),
            SizedBox(width: context.w(10)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.source.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: context.sp(10),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: context.h(4)),
                  Text(
                    article.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.sp(12),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: context.h(4)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          article.author ?? 'Autor desconocido',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey,
                            fontSize: context.sp(12),
                          ),
                        ),
                      ),
                      SizedBox(width: context.w(10)),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                          fontSize: context.sp(12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
