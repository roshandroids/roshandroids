import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roshandroids/src/core/core.dart';

final themeController =
    ChangeNotifierProvider<ThemeController>((ref) => ThemeController());

class ThemeController extends ChangeNotifier {
  ThemeMode? _thememode;

  final Brightness brightness =
      SchedulerBinding.instance.window.platformBrightness;

  ThemeMode get getCurrentThemeMode => _thememode ?? ThemeMode.system;

  ThemeData get getLightThemeData => lightThemeData;
  ThemeData get getDarkThemeData => darkThemeData;

  ThemeData get getCurrentThemeData {
    switch (getCurrentThemeMode) {
      case ThemeMode.light:
        return lightThemeData;
      case ThemeMode.dark:
        return darkThemeData;
      case ThemeMode.system:
        if (brightness == Brightness.light) {
          return lightThemeData;
        } else if (brightness == Brightness.dark) {
          return darkThemeData;
        }
    }
    return lightThemeData;
  }

  void updateCurrentThemeMode(ThemeMode? updatedThemeMode) {
    _thememode = updatedThemeMode;
    notifyListeners();
  }
}
