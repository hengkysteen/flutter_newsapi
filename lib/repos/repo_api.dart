import 'dart:convert';
import 'package:flutter_newsapi/models/news_model.dart';
import 'package:flutter_newsapi/repos/repo_url.dart';
import 'package:http/http.dart' as http;

class RepoApi {
  static Future<List<Articles>> news(String query) async {
    final response = await http.get('${RepoUrl.news}&q=$query&apiKey=${RepoUrl.apiKey}');
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final List data = body['articles'];
      return data.map((e) => Articles.fromJson(e)).toList();
    } else if (response.statusCode == 429) {
      throw Exception('Too Many Requests');
    } else if (response.statusCode == 500) {
      throw Exception('Server Error.');
    } else {
      throw Exception('Error');
    }
  }
}
