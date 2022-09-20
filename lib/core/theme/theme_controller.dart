import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roshandroids/core/theme/app_theme.dart';

final themeController =
    ChangeNotifierProvider<ThemeController>((ref) => ThemeController());

class ThemeController extends ChangeNotifier {
  ThemeMode? _thememode;
  ThemeMode get getCurrentThemeMode => _thememode ?? ThemeMode.system;

  ThemeData get getLightThemeData => lightThemeData;
  ThemeData get getDarkThemeData => darkThemeData;

  set changeThemeMode(ThemeMode? updatedThemeMode) {
    _thememode = updatedThemeMode;
    notifyListeners();
  }
}
