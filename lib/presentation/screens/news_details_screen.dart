import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/domain/models/news.dart';
import 'package:news_app/presentation/bloc/news_feed_bloc.dart';
import 'package:news_app/presentation/bloc/news_feed_event.dart';
import 'package:news_app/presentation/bloc/news_feed_state.dart';
import 'package:news_app/presentation/widgets/news_app_bar.dart';
import 'package:news_app/presentation/widgets/news_article.dart';

class NewsDetailsScreen extends StatelessWidget {
  final News article;

  const NewsDetailsScreen({
    super.key, 
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<NewsFeedBloc, NewsFeedState>(
        builder:(context, state) {
          News liveArticle = article;

          if (state is NewsLoadSuccess) {
            liveArticle = state.articles.firstWhere(
              (element) => element.url == article.url,
              orElse: () => article,
            );
          }

          return CustomScrollView(
            slivers: [
              NewsAppBar(
                title: '',
                centerTitle: true, 
                leadingIcon: Icons.arrow_back, 
                actionIcon: liveArticle.isSaved
                ? Icons.bookmark
                : Icons.bookmark_outline,
                onLeadingPressed: () => context.pop(), 
                onActionPressed: () {
                  return snackBarMessage(context, liveArticle);
                  // context.read<NewsFeedBloc>().add(
                  //     ToggleBookmarkRequested(
                  //       url: liveArticle.url, 
                  //       isSaved: !liveArticle.isSaved,
                  //     ),
                  //   );

                  //   final message = !liveArticle.isSaved
                  //     ? 'Article has been saved successfully'
                  //     : 'Article removed from bookmarks';

                  //   ScaffoldMessenger.of(context)
                  //   ..clearSnackBars()
                  //   ..showSnackBar(SnackBar(content: Text(message)));
                },
              ),

              SliverToBoxAdapter(
                child: NewsArticle(
                  title: liveArticle.title, 
                  urlToImage: liveArticle.urlToImage, 
                  content: liveArticle.content,
                  isSaved: liveArticle.isSaved,
                  onSaveButtonPressed: () {
                    return snackBarMessage(context, liveArticle);
                    // context.read<NewsFeedBloc>().add(
                    //   ToggleBookmarkRequested(
                    //     url: liveArticle.url, 
                    //     isSaved: !liveArticle.isSaved,
                    //   ),
                    // );

                    // final message = !liveArticle.isSaved
                    //   ? 'Article has been saved successfully'
                    //   : 'Article removed from bookmarks';

                    // ScaffoldMessenger.of(context)
                    // ..clearSnackBars()
                    // ..showSnackBar(SnackBar(content: Text(message)));
                  },
                ),
              ),
            ],
          );
        },
      )
    );
  }
}

void snackBarMessage(BuildContext context, News liveArticle) {
  context.read<NewsFeedBloc>().add(
    ToggleBookmarkRequested(
      url: liveArticle.url, 
      isSaved: !liveArticle.isSaved,
    ),
  );

  final message = !liveArticle.isSaved
    ? 'Article has been saved successfully'
    : 'Article removed from bookmarks';

  ScaffoldMessenger.of(context)
  ..clearSnackBars()
  ..showSnackBar(
    SnackBar(
      content: Text(message), 
      duration: Duration(seconds: 1),)
    );
}