import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_constant.dart';
class ApiManager{
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=d4cc963b2b5a412295660d970e0610f6
 */
  static Future<SourceResponse?> getSources()async{
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.endPoint,
        {'apiKey': 'd4cc963b2b5a412295660d970e0610f6'});
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
}