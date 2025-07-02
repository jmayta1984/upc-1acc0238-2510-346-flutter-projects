import 'package:flutter/material.dart';
import 'package:newsly/data/favorite_news_dao.dart';
import 'package:newsly/domain/favorite_news.dart';
import 'package:newsly/domain/news.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key, required this.news});
  final News news;

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    bool isFavorite = await FavoriteNewsDao().isFavorite(widget.news.title);
    if (mounted) {
      setState(() {
        _isFavorite = isFavorite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final news = widget.news;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: OutlinedButton(
        onPressed: () {
          if (_isFavorite) {
            FavoriteNewsDao().removeFavoriteNews(news.title);
          } else {
            FavoriteNewsDao().addFavoriteNews(
              FavoriteNews(
                author: news.author,
                title: news.title,
                image: news.image,
                description: news.description,
              ),
            );
          }

          if (mounted) {
            setState(() {
              _isFavorite = !_isFavorite;
            });
          }
        },
        child: Text(_isFavorite ? 'Remove from favorites' : 'Add to favorites'),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.news.title,
                  child: Image.network(widget.news.image, fit: BoxFit.cover),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.news.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Author: ${widget.news.author}'),
                SizedBox(height: 8),
                Text('Year: ${widget.news.year}'),
                SizedBox(height: 16),
                Text(widget.news.content),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
