import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roshandroids/core/core.dart';
import 'package:roshandroids/feature/home/presentation/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeController);
    return MaterialApp(
      themeMode: themeData.getCurrentThemeMode,
      theme: themeData.getLightThemeData,
      darkTheme: themeData.getDarkThemeData,
      home: const MyHomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
