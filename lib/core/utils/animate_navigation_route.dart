import 'package:flutter/material.dart';

Route animateRoute(Widget animatedPage, {double side = 2}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder: (context, animation, secondaryAnimation) => animatedPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(begin: Offset(side, 0), end: Offset.zero),
        ),
        child: child,
      );
    },
  );
}
