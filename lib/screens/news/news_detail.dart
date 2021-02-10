import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newsapi/models/news_model.dart';
 

class NewsDetail extends StatelessWidget {

  final Articles article;
  NewsDetail(this.article);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 250,
            child: CachedNetworkImage(
              imageUrl: article.urlToImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  article.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  article.publishedAt,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                SizedBox(height: 5),
                Text(article.content),
                SizedBox(height: 40),
                Divider(),
                Text('Source : ${article.source.name}'),
                Text(article.url),
                Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
