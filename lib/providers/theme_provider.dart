import 'package:flutter/material.dart';

enum CustomThemeMode { light, dark }

class ThemeProvider with ChangeNotifier {
  CustomThemeMode _themeMode = CustomThemeMode.light;

  CustomThemeMode get themeMode => _themeMode;

  set themeMode(CustomThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }

  Color get primaryColor {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xff444444);
      case CustomThemeMode.dark:
        return const Color(0xffdddddd);
    }
  }

  Color get highlightColor {
    return const Color(0xff02c2f2);
  }

  Color get backgroundColor {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xffffffff);
      case CustomThemeMode.dark:
        return const Color(0xff222222);
    }
  }
}
