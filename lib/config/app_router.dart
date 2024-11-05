
import 'package:go_router/go_router.dart';
import 'package:news_app/config/app_route_names.dart';
import 'package:news_app/features/home/presentation/screens/article_detail_screen.dart';
import 'package:news_app/features/home/domain/entities/news_response_entity.dart';
import 'package:news_app/features/home/presentation/screens/home_screen.dart';
import 'package:news_app/features/onboarding/presentation/screens/onboarding_screen.dart';

get router => _router;

final _router = GoRouter(
  initialLocation: AppRouteNames.home.path,
  routes: [
    GoRoute(
      path: AppRouteNames.onboarding.path,
      name: AppRouteNames.onboarding.name,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppRouteNames.home.path,
      name: AppRouteNames.home.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: AppRouteNames.articleDetaill.path,
          name: AppRouteNames.articleDetaill.name,
          builder: (context, state) {
            final article = state.extra as ArticleResponseEntity;
            return ArticleDetailScreen(article: article);
          },
        ),
      ]
    ),
  ],
);