import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController implements GetxService {
  ThemeController({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences {
    _themeMode = _readThemeMode();
  }

  static const String _themeModeKey = 'theme_mode';

  final SharedPreferences _sharedPreferences;

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    _sharedPreferences.setString(_themeModeKey, mode.name);
    update();
  }

  void toggleLightDark() {
    setThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  ThemeMode _readThemeMode() {
    final value = _sharedPreferences.getString(_themeModeKey);
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }
}

