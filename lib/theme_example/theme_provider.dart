
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{

  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;


  void setTheme(ThemeMode? mode) {
    if (mode != null) {
      _themeMode = mode;
      notifyListeners();
    }
  }
}