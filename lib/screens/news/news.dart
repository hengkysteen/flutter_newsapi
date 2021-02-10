import 'package:flutter/material.dart';
import 'package:flutter_newsapi/providers/news_provider.dart';
import 'package:flutter_newsapi/widgets/app.dart';
import 'package:provider/provider.dart';
import 'news_list.dart';
import 'news_search.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('News'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => App.push(context, NewsSearch()),
            )
          ],
          elevation: 0,
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(child: Text('Today')),
              Tab(child: Text('Health')),
              Tab(child: Text('Technology')),
              Tab(child: Text('Business')),
              Tab(child: Text('Sport')),
              Tab(child: Text('Asia')),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _buildNews(context, ''),
            _buildNews(context, 'health'),
            _buildNews(context, 'technology'),
            _buildNews(context, 'business'),
            _buildNews(context, 'sport'),
            _buildNews(context, 'asia'),
          ],
        ),
      ),
    );
  }

  Widget _buildNews(BuildContext context, String query) {
    final news = Provider.of<NewsProvider>(context, listen: false);
    return Builder(
      builder: (context) {
        return RefreshIndicator(
          onRefresh: () async => await news.getNews('$query'),
          child: FutureBuilder(
            future: news.getNews('$query'),
            builder: (context, snaps) {
              if (snaps.connectionState == ConnectionState.waiting) {
                return Center(child: App.loading());
              }
              return NewsList(news.news);
            },
          ),
        );
      },
    );
  }
}
