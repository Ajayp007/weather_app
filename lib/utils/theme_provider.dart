import 'package:flutter/material.dart';
import 'package:weather_app/utils/shared_helper.dart';

class ThemeProvider with ChangeNotifier {
  bool themeMode = true;

  void setTheme() async {
    SharedHelper sharedHelper = SharedHelper();
    themeMode = await sharedHelper.getThemeData();
    notifyListeners();
  }
}
