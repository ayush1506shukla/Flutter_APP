import 'package:flutter/material.dart';
import '../models/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Text(article.title),
        subtitle: Text(article.body.length > 50
            ? '${article.body.substring(0, 50)}...'
            : article.body),
      ),
    );
  }
}
