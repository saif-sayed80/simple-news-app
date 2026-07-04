import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/domain/models/news.dart';
import 'package:news_app/presentation/bloc/saved_news_bloc.dart';
import 'package:news_app/presentation/bloc/saved_news_event.dart';
import 'package:news_app/presentation/bloc/saved_news_state.dart';
import 'package:news_app/presentation/router/routes.dart';
import 'package:news_app/presentation/widgets/news_app_bar.dart';
import 'package:news_app/presentation/widgets/saved_news_card.dart';

class SavedNewsScreen extends StatefulWidget {
  final StatefulNavigationShellState navigationShell;
  const SavedNewsScreen({super.key, required this.navigationShell});

  @override
  State<SavedNewsScreen> createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {
  @override
  void initState() {
    super.initState();
    
    context.read<SavedNewsBloc>().add(const FetchSavedNewsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SavedNewsBloc, SavedNewsState>(
        builder:(context, state) {
          return switch (state) {
            SavedNewsInitial() => Center(child: CircularProgressIndicator()),
            SavedNewsLoadInProgress() => Center(child: CircularProgressIndicator()),
            SavedNewsLoadSuccess(:final savedArticles) => _SavedNewsSuccessView(
              savedArticles: savedArticles,
              navigationShell: widget.navigationShell,
            ),
            SavedNewsLoadFailure(:final message) => Center(child: Text("Error: $message"),),
          };
        },
      ),
    );
  }
}

class _SavedNewsSuccessView extends StatelessWidget {
  final List<News> savedArticles;
  final StatefulNavigationShellState navigationShell;

  const _SavedNewsSuccessView({
    required this.savedArticles,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {

    if(savedArticles.isEmpty) {
      return const Center(child: Text("No saved articles yet."));
    }
    return CustomScrollView(
      slivers: [
        NewsAppBar(
          title: 'Saved Articles', 
          centerTitle: false,
          leadingIcon: Icons.arrow_back, 
          actionIcon: Icons.more_vert, 
          onLeadingPressed: () {
            navigationShell.goBranch(0);
          }, 
          onActionPressed: () {},
        ),

        SliverList.builder(
          itemCount: savedArticles.length,
          itemBuilder: (context, index) {
            final savedArticle = savedArticles[index];
            return SavedNewsCard(
              urlToImage: savedArticle.urlToImage, 
              title: savedArticle.title, 
              publishedAt: savedArticle.publishedAt, 
              isSaved: savedArticle.isSaved,
              onTap: () => context.pushNamed(Routes.newsDetailsScreenRoute, extra: savedArticle), 
              onPressed: () {
                context.read<SavedNewsBloc>().add(
                  RemoveBookMarkRequested(url: savedArticle.url)
                );
              },
            );
          },
        ),
      ]
    );
  }
}