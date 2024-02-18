import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_scaled_box.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:skeleton_app/constants/route.const.dart';
import 'package:skeleton_app/pages/error_page/error_page.route.dart';
import 'package:skeleton_app/pages/error_page/error_page.ui.dart';
import 'package:skeleton_app/pages/home/home_page.route.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: navigatorKey,
    errorBuilder: (BuildContext context, GoRouterState state) {
      return const ErrorPage();
    },
    initialLocation: ROUTE.home_page,
    debugLogDiagnostics: true,
    routes: [
      homePageRoute,
      errorPageRoute,
    ],
  ),
);

final contextProvider = Provider<BuildContext?>((ref) {
  final context = ref
      .watch(routerProvider)
      .routerDelegate
      .navigatorKey
      .currentState
      ?.context;

  return context;
});

Page createRoutePage(
  ValueKey<String> key,
  Widget child, {
  bool opaque = true,
  bool fullscreenDialog = false,
  bool maintainState = true,
  bool barrierDismissible = false,
  Object? arguments,
}) {
  return CustomTransitionPage(
    opaque: opaque,
    child: child,
    maintainState: maintainState,
    fullscreenDialog: fullscreenDialog,
    arguments: arguments,
    key: key,
    barrierDismissible: barrierDismissible,
    restorationId: key.value,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ResponsiveScaledBox(
          width: ResponsiveValue<double>(
            context,
            conditionalValues: [
              Condition.equals(name: MOBILE, value: 480),
              Condition.between(start: 800, end: 1100, value: 800),
              Condition.between(start: 1000, end: 1200, value: 1000),
              Condition.between(start: 1200, end: 1800, value: 1250),
              // There are no conditions for width over 1200
              // because the `maxWidth` is set to 1200 via the MaxWidthBox.
            ],
          ).value,
          child: child,
        ),
      );
    },
  );
}
