import 'package:flutter/material.dart';
import 'package:flutter_newsapi/providers/news_provider.dart';
import 'package:flutter_newsapi/widgets/app.dart';
 
import 'package:provider/provider.dart';

import 'news_list.dart';

class NewsSearch extends StatefulWidget {
  @override
  _NewsSearchState createState() => _NewsSearchState();
}

class _NewsSearchState extends State<NewsSearch> {
  
  TextEditingController _controller = TextEditingController();
  bool _loading = false;

  Widget _searchBar(NewsProvider news) {
    return TextField(
      controller: _controller,
      cursorColor: Colors.white,
      style: TextStyle(
        fontSize: 17,
        color: Colors.white,
        decoration: TextDecoration.none,
      ),
      textCapitalization: TextCapitalization.words,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search ...',
        hintStyle: TextStyle(color: Colors.white54),
        border: InputBorder.none,
      ),
      maxLines: 1,
      onChanged: (_) => setState(() {}),
      onSubmitted: (_) async => _onSubmit(news),
    );
  }

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<NewsProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () {
        news.newsQ.clear();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: _searchBar(news),
          actions: <Widget>[
            _controller.text.length > 0
                ? IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _controller.clear();
                        news.newsQ.clear();
                      });
                    },
                  )
                : Center()
          ],
        ),
        body: _loading ? Center(child: App.loading()) : NewsList(news.newsQ),
      ),
    );
  }

  void _onSubmit(NewsProvider news) async {
    if (_controller.text.length <= 1) return;
    setState(() => _loading = true);
    await news.searchNews(_controller.text);
    setState(() => _loading = false);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
