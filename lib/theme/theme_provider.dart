import 'package:flutter/material.dart';
import 'package:habbit_tracker/theme/dark_mode.dart';
import 'package:habbit_tracker/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  //get info from device if its in lightmode
  bool get isDarkMode => _themeData == darkmode;

  //set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
  }

  //toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkmode;
    } else {
      themeData = lightMode;
    }
  }
}
