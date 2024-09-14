import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  List<Sources>? sourcesList;
  String? errorMessage;

  void getSource(String categoryId) async {
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        errorMessage = response!.message;
      } else {
        sourcesList = response!.sources;
      }
    } catch (e) {
      errorMessage = 'Error loading list sources';
    }
    notifyListeners();
  }
}
