import 'dart:convert';

import 'model/news_model.dart';
import 'news_list.dart';
import 'package:http/http.dart' as http;

class NewsBloc {
  final String newsUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=your api key";

  List<NewsModel> news;

  Future<List<NewsModel>> loadNewsData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonNewsData = jsonDecode(dataString);
    news = NewsList.fromJson(jsonNewsData['articles']).newsList;
    return news;
  }

  Future<String> loadAsset() async {
    var response = await http.get(Uri.encodeFull(newsUrl),
        headers: {"Accept": "application/json"});
    return response.body;
  }
}