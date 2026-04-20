import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouteNavExtension on BuildContext {
  void popUntil(bool Function(GoRoute route) predicate) {
    final delegate = GoRouter.of(this).routerDelegate;
    var config = delegate.currentConfiguration;
    var routes = config.routes.whereType<GoRoute>();
    while (routes.length > 1 && !predicate(config.last.route)) {
      config = config.remove(config.last);
      routes = config.routes.whereType<GoRoute>();
    }
    delegate.setNewRoutePath(config);
  }

  // void popUntilAndPush(
  //   String route,
  //   bool Function(GoRoute route) predicate, {
  //   Object? extra,
  // }) {
  //   final router = GoRouter.of(this);
  //   popUntil(predicate);
  //   Future.microtask(() {
  //     router.push(route, extra: extra);
  //   });
  // }
  //
  //   void popUntilAndGo(
  //   String route,
  //   bool Function(GoRoute route) predicate, {
  //   Object? extra,
  // }) {
  //   final router = GoRouter.of(this);
  //   popUntil(predicate);
  //   Future.microtask(() {
  //     router.go(route, extra: extra);
  //   });
  // }
}