import 'package:flutter/material.dart';
import '../helpers/helpers.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  get themeMode => _themeMode;

  toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    StorageHelper.setBool(StorageKeys.theme, isDark);
    notifyListeners();
  }
}
