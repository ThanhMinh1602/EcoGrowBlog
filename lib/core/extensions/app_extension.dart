import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

extension AppExtension on BuildContext {
  double getWidth() => MediaQuery.of(this).size.width;
  double getHeight() => MediaQuery.of(this).size.height;
  void pushAndRemoveUntil({required Widget screen}) {
    Navigator.of(this).pushAndRemoveUntil(
      PageTransition(
        duration: const Duration(seconds: 2),
        type: PageTransitionType.fade,
        child: screen,
      ),
      (route) => false,
    );
  }

  void push({required Widget screen}) {
    Navigator.of(this).push(
      PageTransition(
        duration: const Duration(milliseconds: 100),
        type: PageTransitionType.fade,
        child: screen,
      ),
    );
  }
}
