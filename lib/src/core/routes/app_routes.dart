import 'package:roshandroids/src/core/core.dart';

class AppRoutes {
  static final AppRouteModel splashRoute =
      AppRouteModel(routeName: 'splash', path: '/splash');
  static final AppRouteModel rootRoute =
      AppRouteModel(routeName: 'root', path: '/root');
  static final AppRouteModel homeRoute =
      AppRouteModel(routeName: 'home', path: '/');
  static final AppRouteModel portfolioRoute =
      AppRouteModel(routeName: 'portfolio', path: '/portfolio');
  static final AppRouteModel blogsRoute =
      AppRouteModel(routeName: 'blogs', path: '/blogs');
  static final AppRouteModel resumeRoute =
      AppRouteModel(routeName: 'resume', path: '/resume');
  static final AppRouteModel errorRoute =
      AppRouteModel(routeName: 'error', path: '/error');
}
