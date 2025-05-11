import 'package:flutter/material.dart';
import '../models/article.dart';

class DetailScreen extends StatelessWidget {
  final Article article;
  const DetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Article Details')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(article.body, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
