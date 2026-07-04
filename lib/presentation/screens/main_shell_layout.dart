import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/presentation/widgets/bottom_nav_bar.dart';

class MainShellLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShellLayout({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(index);
        },
      ),
    );
  }
}