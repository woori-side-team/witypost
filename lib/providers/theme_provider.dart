import 'package:flutter/material.dart';

enum CustomThemeMode { light, dark }

class ThemeProvider with ChangeNotifier {
  CustomThemeMode _themeMode = CustomThemeMode.light;

  CustomThemeMode get themeMode => _themeMode;

  set themeMode(CustomThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }

  Color get logoColor {
    return const Color(0xff669aec);
  }

  Color get neutral0Color {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xffffffff);
      case CustomThemeMode.dark:
        return const Color(0xff171a1d);
    }
  }

  Color get neutral100Color {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xfff7f8f9);
      case CustomThemeMode.dark:
        return const Color(0xff1e2125);
    }
  }

  Color get neutral200Color {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xfff1f2f4);
      case CustomThemeMode.dark:
        return const Color(0xff23272b);
    }
  }

  Color get neutral300Color {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xffdddfe3);
      case CustomThemeMode.dark:
        return const Color(0xff2d3339);
    }
  }

  Color get neutral400Color {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xffb4b9c3);
      case CustomThemeMode.dark:
        return const Color(0xff474f58);
    }
  }

  Color get neutral500Color {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xff8790a0);
      case CustomThemeMode.dark:
        return const Color(0xff5c6772);
    }
  }

  Color get neutral600Color {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xff778193);
      case CustomThemeMode.dark:
        return const Color(0xff768394);
    }
  }

  Color get neutral700Color {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xff646f84);
      case CustomThemeMode.dark:
        return const Color(0xff8996a5);
    }
  }

  Color get neutral800Color {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xff47546d);
      case CustomThemeMode.dark:
        return const Color(0xffa2adbb);
    }
  }

  Color get neutral900Color {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xff303d5b);
      case CustomThemeMode.dark:
        return const Color(0xffb8c2ce);
    }
  }

  Color get neutral1000Color {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xff1c2a4b);
      case CustomThemeMode.dark:
        return const Color(0xffc9d1da);
    }
  }

  Color get neutral1100Color {
    switch (themeMode) {
      case CustomThemeMode.light:
        return const Color(0xff0e1e40);
      case CustomThemeMode.dark:
        return const Color(0xffdfe4e9);
    }
  }
}
