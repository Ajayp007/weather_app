import 'package:flutter/material.dart';
import 'package:weather_app/screen/detail/detail_screen.dart';
import 'package:weather_app/screen/home/view/home_screen.dart';
import 'package:weather_app/screen/splash/splash_screen.dart';
import '../screen/bookmark/bookmark_screen.dart';

Map<String, WidgetBuilder> app_routes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'location': (context) => const BookmarkScreen(),
  'detail': (context) => const DetailScreen(),
};
