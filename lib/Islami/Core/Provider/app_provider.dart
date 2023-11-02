import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLocale = "en";

// the function using Manage application theme changes
  void changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  //change background the application
  String getBackgroundImage() {
    return currentTheme == ThemeMode.dark
        ? "assets/images/background_dart.png"
        : "assets/images/background_light.png";
  }

//change Splash  the application
  String splashScreen() {
    return currentTheme == ThemeMode.dark
        ? "assets/images/splash_dart.png"
        : "assets/images/Splash.png";
  }

  // change the mode if is dark then done else light and
  // the action take in settings by use ? "light":"dark"
  bool isDarkEnabled() {
    return currentTheme == ThemeMode.dark;
  }

  // the function using Manage application languages  changes

  void changeLocal(String newLocale) {
    if (newLocale == currentLocale) return;
    currentLocale = newLocale;
    notifyListeners();
  }
}
