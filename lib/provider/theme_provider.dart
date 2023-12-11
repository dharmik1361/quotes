import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isList = true;
  ThemeMode themeMode = ThemeMode.light;

  void changeView() {
    isList = !isList;
    notifyListeners();
  }

  void changeTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
