import 'package:roshandroids/src/core/core.dart';
import 'package:roshandroids/src/features/blogs/blogs.dart';
import 'package:roshandroids/src/features/home/home.dart';
import 'package:roshandroids/src/features/portfolio/portfolio.dart';
import 'package:roshandroids/src/features/resume/resume.dart';
import 'package:roshandroids/src/features/root/root.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final rootNavigator = GlobalKey<NavigatorState>(debugLabel: 'root');
  final shellNavigator = GlobalKey<NavigatorState>(debugLabel: 'shell');
  return GoRouter(
    initialLocation: AppRoutes.splashRoute.path,
    navigatorKey: rootNavigator,
    routes: [
      GoRoute(
        path: AppRoutes.splashRoute.path,
        name: AppRoutes.splashRoute.routeName,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
        redirect: (_) => AppRoutes.homeRoute.path,
      ),
      ShellRoute(
        navigatorKey: shellNavigator,
        builder: (context, state, child) =>
            RootScreen(key: state.pageKey, child: child),
        routes: [
          GoRoute(
            path: AppRoutes.homeRoute.path,
            name: AppRoutes.homeRoute.routeName,
            pageBuilder: (context, state) => FadeTransitionPage(
              key: state.pageKey,
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutes.portfolioRoute.path,
            name: AppRoutes.portfolioRoute.routeName,
            pageBuilder: (context, state) => FadeTransitionPage(
              key: state.pageKey,
              child: const PortfolioScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutes.blogsRoute.path,
            name: AppRoutes.blogsRoute.routeName,
            pageBuilder: (context, state) => FadeTransitionPage(
              key: state.pageKey,
              child: const BlogsScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutes.resumeRoute.path,
            name: AppRoutes.resumeRoute.routeName,
            pageBuilder: (context, state) => FadeTransitionPage(
              key: state.pageKey,
              child: const ResumeScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.errorRoute.path,
        name: AppRoutes.errorRoute.routeName,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const NotFoundScreen(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (c, animation, a2, child) => FadeTransition(
            opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
            child: child,
          ),
        );
}
