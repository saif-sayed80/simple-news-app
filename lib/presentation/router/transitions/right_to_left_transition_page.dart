import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class RightToLeftTransitionPage extends CustomTransitionPage {
  RightToLeftTransitionPage({
    required super.key,
    required super.child,
    Duration duration = const Duration(milliseconds: 350),
  }) : super(
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeOutCubic)),
        ),
        child: child,
      );
    },
  );
}