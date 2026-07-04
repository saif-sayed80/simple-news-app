import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/domain/models/news.dart';
import 'package:news_app/presentation/router/routes.dart';
import 'package:news_app/presentation/router/transitions/right_to_left_transition_page.dart';
import 'package:news_app/presentation/screens/main_shell_layout.dart';
import 'package:news_app/presentation/screens/news_details_screen.dart';
import 'package:news_app/presentation/screens/news_feed_screen.dart';
import 'package:news_app/presentation/screens/saved_news_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.newsScreen,
    routes: _buildRoutes()
  );

  static List<RouteBase> _buildRoutes() {
    return [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellLayout(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.newsScreen,
                name: Routes.newsScreenRoute,
                builder: (context, state) => const NewsFeedScreen()
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/explore',
                builder: (context, state) => const Scaffold(body: Center(child: Text("Explore"))),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.savedNewsScreen,
                name: Routes.savedNewsScreenRoute,
                builder: (context, state) => SavedNewsScreen(
                  navigationShell: StatefulNavigationShell.of(context)
                )
              )
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const Scaffold(body: Center(child: Text("Settings"))),
              ),
            ],
          ),
        ],
      ),
          
      GoRoute(
        path: Routes.newsDetailsScreen,
        name: Routes.newsDetailsScreenRoute,
        pageBuilder: (context, state) {
          final news = state.extra as News;
          return RightToLeftTransitionPage(
            key: state.pageKey, 
            child: NewsDetailsScreen(article: news)
          );
        },
      ),     
    ];
  }
}
