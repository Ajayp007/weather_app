import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screen/home/provider/home_provider.dart';
import 'package:weather_app/utils/app_routes.dart';
import 'package:weather_app/utils/app_theme.dart';
import 'package:weather_app/utils/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ThemeProvider(),
        ),
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          value.setTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: app_routes,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                value.themeMode == true ? ThemeMode.light : ThemeMode.dark,
          );
        },
      ),
    ),
  );
}
