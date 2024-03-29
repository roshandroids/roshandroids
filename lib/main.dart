import 'dart:async';
import 'package:roshandroids/src/app/app.dart';
import 'package:roshandroids/src/core/core.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // turn off # in ther url on the web
    GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

    await Motion.instance.initialize();
    Motion.instance.setUpdateInterval(60.fps);

    runApp(const ProviderScope(child: MyApp()));

    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('An error occurred'.hardcoded),
        ),
        body: Center(
          child: Text(
            details.toString(),
          ),
        ),
      );
    };
  }, (Object error, StackTrace stack) {
    // * Log any errors to console
    debugPrint(
      error.toString(),
    );
  });
}
