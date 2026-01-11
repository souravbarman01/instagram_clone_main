
import 'package:flutter/material.dart';

import '../util/app_constants.dart';

ThemeData instagramLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: AppConstants.fontFamily,

  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  cardColor: const Color(0xFFFFFFFF),

  primaryColor: const Color(0xFF3797EF), // Instagram blue
  disabledColor: const Color(0xFFBDBDBD),
  hintColor: const Color(0xFF8E8E8E),

  shadowColor: Colors.black.withValues(alpha: 0.05),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF0095F6),
    ),
  ),

  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0095F6),
    secondary: Color(0xFF0095F6),
    error: Color(0xFFED4956),
    surface: Color(0xFFFFFFFF),
  ),

  popupMenuTheme: const PopupMenuThemeData(
    color: Colors.white,
    surfaceTintColor: Colors.white,
  ),

  dialogTheme: const DialogThemeData(
    surfaceTintColor: Colors.white,
    backgroundColor: Colors.white,
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: const Color(0xFF0095F6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(500),
    ),
  ),

  bottomAppBarTheme: const BottomAppBarThemeData(
    color: Colors.white,
    surfaceTintColor: Colors.white,
    height: 56,
  ),

  dividerTheme: DividerThemeData(
    color: const Color(0xFFDBDBDB),
    thickness: 0.5,
  ),

  tabBarTheme: const TabBarThemeData(
    dividerColor: Colors.transparent,
    labelColor: Colors.black,
    unselectedLabelColor: Color(0xFF8E8E8E),
  ),
);
