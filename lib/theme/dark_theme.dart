
import 'package:flutter/material.dart';

import '../util/app_constants.dart';

ThemeData instagramDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: AppConstants.fontFamily,

  scaffoldBackgroundColor: const Color(0xFF000000),
  cardColor: const Color(0xFF121212),

  primaryColor: const Color(0xFF3797EF),
  disabledColor: const Color(0xFF6E6E6E),
  hintColor: const Color(0xFF8E8E8E),

  shadowColor: Colors.white.withValues(alpha: 0.04),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF0095F6),
    ),
  ),

  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF0095F6),
    secondary: Color(0xFF0095F6),
    error: Color(0xFFED4956),
    surface: Color(0xFF121212),
  ),

  popupMenuTheme: const PopupMenuThemeData(
    color: Color(0xFF1E1E1E),
    surfaceTintColor: Color(0xFF1E1E1E),
  ),

  dialogTheme: const DialogThemeData(
    surfaceTintColor: Colors.transparent,
    backgroundColor: Color(0xFF1E1E1E),
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: const Color(0xFF0095F6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(500),
    ),
  ),

  bottomAppBarTheme: const BottomAppBarThemeData(
    color: Color(0xFF000000),
    surfaceTintColor: Colors.black,
    height: 56,
  ),

  dividerTheme: DividerThemeData(
    color: const Color(0xFF2F2F2F),
    thickness: 0.5,
  ),

  tabBarTheme: const TabBarThemeData(
    dividerColor: Colors.transparent,
    labelColor: Colors.white,
    unselectedLabelColor: Color(0xFF8E8E8E),
  ),
);
