import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/screens/instagram_account_login_screen.dart';
import '../features/splash/screens/splash_screen.dart';

class RouteHelper {
  static const String splash = '/';
  static const String auth = '/auth';

  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: auth,
        name: 'auth',
        builder: (context, state) => const InstagramAuthorizationScreen(),
      ),
    ],
  );
}
