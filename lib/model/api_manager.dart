import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/NewResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_constant.dart';
class ApiManager{
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=d4cc963b2b5a412295660d970e0610f6
 */
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.endPoint,
        {'apiKey': ApiConstant.apikey, 'category': categoryId});
    var response = await http.get(url);
    try{
      var responseBody = response.body;
      var json =  jsonDecode(responseBody);   // convert body from string to json.
      return SourceResponse.fromJson(json);
    }catch(e){
      throw e;
    }

   // SourceResponse.fromJson(jsonDecode(response.body));
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=d4cc963b2b5a412295660d970e0610f6
   */

  static Future<NewResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.newResponse,
        {'apiKey': ApiConstant.apikey, 'sources': sourceId});
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}