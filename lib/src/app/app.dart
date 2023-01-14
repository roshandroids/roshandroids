import 'package:roshandroids/src/core/core.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeController);
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) => 'Roshandroids'.hardcoded,
      themeMode: themeData.getCurrentThemeMode,
      theme: themeData.getLightThemeData,
      darkTheme: themeData.getDarkThemeData,
      builder: (context, child) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, child!),
        minWidth: 480,
        mediaQueryData: MediaQuery.of(context),
        defaultScale: true,
        defaultName: MOBILE,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.resize(980, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
        ],
        background: ColoredBox(
          color: themeData.getCurrentThemeData.backgroundColor,
        ),
      ),
    );
  }
}
