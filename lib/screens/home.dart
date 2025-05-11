import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/article_provider.dart';
import '../widgets/article_card.dart';
import 'detail.dart';
import '../models/article.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ArticleProvider>(context, listen: false);
    provider.fetchArticles();
  }

  void _handleSearchAndNavigate(BuildContext context) {
    final provider = Provider.of<ArticleProvider>(context, listen: false);
    final query = _controller.text.trim().toLowerCase();

    final match = provider.articles.firstWhere(
      (article) =>
          article.title.toLowerCase().contains(query) ||
          article.body.toLowerCase().contains(query),
      orElse: () => Article(id: -1, title: '', body: ''),
    );

    if (match.id != -1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailScreen(article: match),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No article found matching "$query"')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ArticleProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Articles')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Search.....',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: provider.search,
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _handleSearchAndNavigate(context),
                  child: Text('Go'),
                ),
              ],
            ),
          ),
          Expanded(
            child: provider.isLoading
                ? Center(child: CircularProgressIndicator())
                : provider.error.isNotEmpty
                    ? Center(child: Text(provider.error))
                    : ListView.builder(
                        itemCount: provider.articles.length,
                        itemBuilder: (_, index) {
                          final article = provider.articles[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    DetailScreen(article: article),
                              ),
                            ),
                            child: ArticleCard(article: article),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
