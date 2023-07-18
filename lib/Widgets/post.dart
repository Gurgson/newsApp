import 'package:flutter/material.dart';
import 'package:simple_news_app/models/articles.dart';

class Post extends StatelessWidget {
  final Article article;

  const Post({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.8)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            article.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          (() {
            final url = article.urlToImage;

            try {
              if (url != null) {
                return Image.network(
                  url,
                  // width: 200,
                  // height: 200,
                );
              } else {
                return const SizedBox(
                  height: 1,
                );
              }
            } catch (e) {
              return const SizedBox(
                height: 1,
              );
            }
          }()),
          const SizedBox(
            height: 20,
          ),
          Text(article.description),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (() {
                final author = article.author;
                if (author != null) {
                  return Text((() {
                    if (author.length >= 25) {
                      return author.substring(0, 25) + "...";
                    } else {
                      return author;
                    }
                  }()));
                } else {
                  return const SizedBox(
                    height: 1,
                  );
                }
              }()),
              Text((() {
                final date = DateTime.parse(article.publishedAt);
                return "${date.day.toString()}/${date.month.toString()}/${date.year.toString()}";
              }())),
            ],
          )
        ]),
      ),
    );
  }
}
