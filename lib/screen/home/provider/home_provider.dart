import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screen/home/model/home_model.dart';
import 'package:weather_app/utils/shared_helper.dart';
import '../../../utils/helper/api_helper.dart';

class HomeProvider with ChangeNotifier {
  Future<HomeModel?>? model;

  Connectivity connectivity = Connectivity();
  bool? isInternet;
  String searchCity = "junagadh";

  List<String?>? bookmark = [];

  ApiHelper helper = ApiHelper();

  void search(String s) {
    searchCity = s;
    getWeatherData();
  }

  Future<void> getBookmark() async {
    SharedHelper sharedHelper = SharedHelper();
    List<String> bookmarkData = await sharedHelper.getBookmarkData();
    if (bookmarkData != null) {
      bookmarkData.addAll(
        [searchCity],
      );
      sharedHelper.setBookmarkData(bookmarkData);
      notifyListeners();
    }
  }

  void getWeatherData() {
    model = helper.getWeatherAPI(city: searchCity);
    model!.then(
      (value) {
        if (value != null) {
          notifyListeners();
        }
      },
    );
  }

  void checkConnection() async {
    connectivity.onConnectivityChanged.listen(
      (event) {
        if (event.contains(ConnectivityResult.none)) {
          isInternet = false;
        } else {
          isInternet = true;
        }
        notifyListeners();
      },
    );
  }
}
