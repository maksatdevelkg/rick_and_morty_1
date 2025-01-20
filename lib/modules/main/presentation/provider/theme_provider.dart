import 'package:flutter/material.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';

enum AppThemeMode { dark, light }

class ThemeProvider extends ChangeNotifier {
  AppThemeMode currentThemeValue = AppThemeMode.light;

  Color getColorDark() {
    return currentThemeValue == AppThemeMode.dark ? Colors.white : Colors.black;
  }

  Color getColorLight() {
    return currentThemeValue == AppThemeMode.light
        ? Colors.white
        : AppColors.mainDart;
  }

  ThemeData currentThemeData = ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 248, 250, 252));

  void applyDarkTheme() {
    currentThemeValue = AppThemeMode.dark;
    currentThemeData = darkTheme;
    notifyListeners();
  }

  void applyLightTheme() {
    currentThemeValue = AppThemeMode.light;
    currentThemeData = lightTheme;
    notifyListeners();
  }

  final darkTheme = ThemeData(
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: AppColors.mainDart,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
      ));

  final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)));
}
