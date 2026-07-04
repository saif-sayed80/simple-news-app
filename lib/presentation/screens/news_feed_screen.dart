import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/domain/models/news.dart';
import 'package:news_app/presentation/bloc/news_feed_bloc.dart';
import 'package:news_app/presentation/bloc/news_feed_event.dart';
import 'package:news_app/presentation/bloc/news_feed_state.dart';
import 'package:news_app/presentation/router/routes.dart';
import 'package:news_app/presentation/widgets/news_app_bar.dart';
import 'package:news_app/presentation/widgets/news_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<NewsFeedBloc, NewsFeedState>(
        builder:(context, state) {
          return switch (state) {
            NewsInitial() => Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: Colors.black, 
                size: 70,
              ),
            ),
            NewsLoadInProgress() => Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: Colors.black, 
                size: 70,
              ),
            ),
            NewsLoadSuccess(:final articles) => _NewsSuccessView(articles: articles),
            NewsLoadFailure(:final message) => Center(
              child: Text("Error: $message"),
            ),
          };
        },
      ),
    );
  }
}

class _NewsSuccessView extends StatelessWidget {
  final List<News> articles;
  const _NewsSuccessView({required this.articles});

  @override
  Widget build(BuildContext context) {

    if(articles.isEmpty) {
      return const Center(
        child: Text("No articles found at the moment.")
      );
    }
    return RefreshIndicator(
      onRefresh: () async {
        return context.read<NewsFeedBloc>().add(const RefreshNewsRequested());
      },
      child: CustomScrollView(
        slivers: [
          NewsAppBar(
            title: "Top Headlines",
            centerTitle: true,
            leadingIcon: Icons.menu,
            actionIcon: Icons.search,
            onLeadingPressed: () {},
            onActionPressed:() {},
          ),

          SliverList.builder(
            itemCount: articles.length,
            itemBuilder:(context, index) {
              final article = articles[index];
              return NewsCard(
                urlToImage: article.urlToImage, 
                title: article.title, 
                description: article.description, 
                publishedAt: article.publishedAt,
                isSaved: article.isSaved,
                onArticleTap: () => context.pushNamed(Routes.newsDetailsScreenRoute, extra: article),
                onBookmarkPressed: () {
                  context.read<NewsFeedBloc>().add(
                    ToggleBookmarkRequested(
                      url: article.url, 
                      isSaved: !article.isSaved,
                    ),
                  );

                  final message = !article.isSaved 
                    ? 'Article has been saved successfully'
                    : 'Article removed from bookmarks';

                  ScaffoldMessenger.of(context)
                    ..clearSnackBars()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(message),
                        duration: Duration(seconds: 1),
                      )
                    );
                },
              );
            },
          )
        ],
      )
    );
  }
}