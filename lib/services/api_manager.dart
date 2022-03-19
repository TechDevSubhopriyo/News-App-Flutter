import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constants/strings.dart';
import 'package:news_app/models/news_model.dart';

class API_Manager {
  Future<NewsModel> fetchNews(var l) async {
    var client = http.Client();

    var newsModel = null;

    try {
      String api = (l == 'english') ? Strings.news_english : Strings.news_hindi;
      var response = await client.get(Uri.parse(api));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } on Exception {
      return newsModel;
    }
    return newsModel;
  }
}
