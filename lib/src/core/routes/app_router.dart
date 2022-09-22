import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roshandroids/src/core/core.dart';
import 'package:roshandroids/src/features/home/home.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: RoutePaths.homeRoute.path,
        name: RoutePaths.homeRoute.routeName,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RoutePaths.errorRoute.path,
        name: RoutePaths.errorRoute.routeName,
        builder: (context, state) => const NotFoundScreen(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});
