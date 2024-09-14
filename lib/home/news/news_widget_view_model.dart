import 'package:flutter/material.dart';
import 'package:news_app/model/NewResponse.dart';
import 'package:news_app/model/api_manager.dart';

class NewsWidgetViewModel extends ChangeNotifier {
  List<Articles>? newsList;
  String? errorMessage;

  void getNews(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        errorMessage = response!.message;
      } else {
        newsList = response!.articles;
      }
    } catch (e) {
      errorMessage = ' loading error news list';
    }
    notifyListeners();
  }
}
