import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

abstract class BaseRouter {
  List<RouteBase> routes({List<RouteBase> children = const []});
}

CustomTransitionPage buildAnimatedPage({
  required Widget child,
  Duration duration = const Duration(
    milliseconds: 500,
  ), // Default animation duration
  Offset enterBegin = const Offset(
    1,
    0,
  ), // Default enter animation (from bottom)
  Offset exitEnd = Offset.zero, // Default exit animation (to top)
}) {
  return CustomTransitionPage(
    transitionDuration: duration,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: enterBegin, // Enter animation start position
          end: Offset.zero, // Enter animation end position
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero, // Exit animation start position
            end: exitEnd, // Exit animation end position
          ).animate(secondaryAnimation),
          child: child,
        ),
      );
    },
  );
}
