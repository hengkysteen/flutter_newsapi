import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newsapi/models/news_model.dart';
import 'package:flutter_newsapi/screens/news/news_detail.dart';
import 'package:flutter_newsapi/widgets/app.dart';
 

class NewsList extends StatelessWidget {
  
  final List<Articles> _news;
  NewsList(this._news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _news.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Container(
            color: Colors.grey[200],
            width: 120,
            child: CachedNetworkImage(
              imageUrl: _news[i].urlToImage ??
                  'https://i.postimg.cc/L8DCbLj1/no-300x300.png',
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            _news[i].title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            _news[i].description ?? '...',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () => App.push(context, NewsDetail(_news[i])),
        );
      },
    );
  }
}
