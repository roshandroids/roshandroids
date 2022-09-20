import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightThemeData = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xff1145a4),
    primaryContainer: Color(0xff9fb4da),
    secondary: Color(0xffb61d1d),
    secondaryContainer: Color(0xffe1a4a4),
    tertiary: Color(0xff376bca),
    tertiaryContainer: Color(0xffcfdbf2),
    appBarColor: Color(0xffcfdbf2),
    error: Color(0xffb00020),
  ),
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 20,
  appBarOpacity: 0.95,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    blendOnColors: false,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: GoogleFonts.notoSans().fontFamily,
);
final ThemeData darkThemeData = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xffbbcae5),
    primaryContainer: Color(0xff577cbf),
    secondary: Color(0xffe9bfbf),
    secondaryContainer: Color(0xffcb6060),
    tertiary: Color(0xffdde5f5),
    tertiaryContainer: Color(0xff7297d9),
    appBarColor: Color(0xffdde5f5),
    error: Color(0xffb00020),
  ),
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 15,
  appBarOpacity: 0.90,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 30,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: GoogleFonts.notoSans().fontFamily,
);
