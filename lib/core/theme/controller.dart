/*
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode _mode = DefaultSettings.getThemeMode();

  ThemeMode get mode => _mode;

  bool get isSystem => _mode == ThemeMode.system;
  bool get isDark => _mode == ThemeMode.dark;
  bool get isLight => _mode == ThemeMode.light;

  Future<void> setTheme(ThemeMode mode) async {
    if (_mode == mode) return;

    _mode = mode;
    await DefaultSettings.setThemeMode(mode);
    notifyListeners();
  }

  /// Call this if you want to reset to follow device
  Future<void> useSystemTheme() async {
    await setTheme(ThemeMode.system);
  }
}

*/