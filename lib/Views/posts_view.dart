import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_news_app/Widgets/post.dart';
import 'package:simple_news_app/models/articles.dart';

class PostView extends StatefulWidget {
  final String query;
  const PostView({required this.query, super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late Future<List<Article>> news;
  final ScrollController _scrollController = ScrollController();
  bool isLoading = true;
  int page = 1;
  String publicKey = "febf23615942406cb62faff8a0f8767d";
  Future<List<Article>> fetchArticle() async {
    final res = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=${widget.query}&apiKey=$publicKey&pageSize=10&page=$page"));

    if (res.statusCode == 200) {
      page++;
      Map<String, dynamic> json = jsonDecode(res.body);
      isLoading = false;
      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }

  @override
  void initState() {
    super.initState();
    news = fetchArticle();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        setState(() {
          news = fetchArticle();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Results for searching: ${widget.query}"),
        ),
        body: Container(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.secondary),
          child: FutureBuilder<List<Article>>(
            future: news,
            builder: (context, snapshot) {
              if (snapshot.connectionState != null &&
                  snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  !isLoading) {
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: snapshot.data!.length + 1,
                  itemBuilder: (context, index) {
                    if (index < snapshot.data!.length) {
                      final article = snapshot.data![index];

                      return Post(
                        article: article,
                      );
                    } else {
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                );
              }
              if (snapshot.hasError) {
                return Text(snapshot.toString());
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
