import 'package:flutter/material.dart';

class SlideLeftRoute<T> extends MaterialPageRoute<T> {
  SlideLeftRoute({required super.builder, super.settings});
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == "SplashPage") {
      return child;
    }
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(
          CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
      child: child,
    );
  }
}
