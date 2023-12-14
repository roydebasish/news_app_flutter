import 'dart:convert';
import 'package:get/get.dart';
import 'package:news_app_flutter/src/constants/constants.dart';
import '../model/Headlines.dart';
import 'package:http/http.dart' as http;

class HeadLineService extends GetConnect{

  static var client = http.Client();
  static var BASE_URL = Constants.baseUrl;

  static Future<List<Article>?> getTopHeadlinesNews({String country = 'us', String? category}) async {

    String finalUrl;
    if(category == null){
      finalUrl = "";
      finalUrl = '$BASE_URL&country=$country';
    }else{
      finalUrl = "";
      finalUrl = '$BASE_URL&category=$category&country=$country';
    }


    final response = await client.get(Uri.parse(finalUrl));
    // print(finalUrl);

      if(response.statusCode == 200){
        var jsondata = jsonDecode(response.body);
        return  (jsondata['articles'] as List).map((e) => Article.fromJson(e)).toList();
      }else{
        return null;
      }


  }
}
