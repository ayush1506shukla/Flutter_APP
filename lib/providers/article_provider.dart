import 'package:flutter/material.dart';
import '../models/article.dart';
import '../services/api_service.dart';

class ArticleProvider with ChangeNotifier {
  List<Article> _articles = [];
  List<Article> _filtered = [];
  bool _isLoading = false;
  String _error = '';

  List<Article> get articles => _filtered;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchArticles() async {
    _isLoading = true;
    notifyListeners();

    try {
      _articles = await ApiService.fetchArticles();
      _filtered = _articles;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void search(String query) {
    _filtered = _articles
        .where((a) =>
            a.title.toLowerCase().contains(query.toLowerCase()) ||
            a.body.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
