import 'package:flutter/material.dart';
import 'package:flutter_newsapi/models/news_model.dart';
import 'package:flutter_newsapi/repos/repo_api.dart';
import 'package:flutter_newsapi/widgets/app.dart';
 
class NewsProvider with ChangeNotifier {
  
  List<Articles> news = [];
  List<Articles> newsQ = [];

  Future<List<Articles>> getNews(String query) async {
    try {
      news = await RepoApi.news(query);
    } catch (e) {
      App.toast(e.message);
    }
    return news;
  }

  Future searchNews(String query) async {
    try {
      newsQ = await RepoApi.news(query);
    } catch (e) {
      App.toast(e.message);
    }
    return newsQ;
  }
}
