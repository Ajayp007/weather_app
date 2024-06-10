import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper
{
  void setThemeData(bool themeData) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setBool('true', themeData);
  }

  Future<bool> getThemeData() async {
    bool? data;

    SharedPreferences shr = await SharedPreferences.getInstance();
    data = shr.getBool('true');
    return data!;
  }

  Future<void> setBookmarkData(List<String> l1) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList('book', l1);
  }

  Future<List<String>> getBookmarkData() async {
    List<String>? book = [];

    SharedPreferences shr = await SharedPreferences.getInstance();
    book = shr.getStringList('book');
    return book!;
  }
}
