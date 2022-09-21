import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roshandroids/src/core/core.dart';

final themeController =
    ChangeNotifierProvider<ThemeController>((ref) => ThemeController());

class ThemeController extends ChangeNotifier with WidgetsBindingObserver {
  ThemeController() {
    WidgetsBinding.instance.addObserver(this);
    brightness = SchedulerBinding.instance.window.platformBrightness;
  }
  ThemeMode? _thememode;

  late Brightness brightness;

  ThemeMode get getCurrentThemeMode => _thememode ?? ThemeMode.system;

  ThemeData get getLightThemeData => lightThemeData;
  ThemeData get getDarkThemeData => darkThemeData;

  bool get isDarkTheme => _isDarkTheme();

  ThemeData get getCurrentThemeData {
    if (_isDarkTheme()) {
      return darkThemeData;
    }
    return lightThemeData;
  }

  bool _isDarkTheme() {
    switch (getCurrentThemeMode) {
      case ThemeMode.light:
        return false;
      case ThemeMode.dark:
        return true;
      case ThemeMode.system:
        if (brightness == Brightness.light) {
          return false;
        }
        return true;
    }
  }

  void updateCurrentThemeMode(ThemeMode? updatedThemeMode) {
    _thememode = updatedThemeMode;
    notifyListeners();
  }

  @override
  void didChangePlatformBrightness() {
    brightness = SchedulerBinding.instance.window.platformBrightness;
    updateCurrentThemeMode(
      brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
    );
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
