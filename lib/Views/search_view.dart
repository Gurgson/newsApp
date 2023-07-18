import 'package:flutter/material.dart';
import 'package:simple_news_app/Views/posts_view.dart';
import 'package:simple_news_app/Widgets/suggestion.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Welcome to search page"),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("What are you looking for?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search,
                            color: Theme.of(context).colorScheme.tertiary),
                        hintText: "What are you interested in?",
                        hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                        focusColor: Theme.of(context).colorScheme.tertiary,
                        suffixIconColor:
                            Theme.of(context).colorScheme.tertiary),
                    onSubmitted: (value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostView(
                                  query: value,
                                )),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("U Can't decide?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                      child: Column(
                    children: <Widget>[
                      Suggestion(
                        query: "Sports",
                        url: "assets/images/sports.jpg",
                      ),
                      Suggestion(
                        query: "Technology",
                        url: "assets/images/technology.jpg",
                      ),
                      Suggestion(
                        query: "Buisness",
                        url: "assets/images/buisness.jpg",
                      ),
                      Suggestion(
                        query: "Games",
                        url: "assets/images/games.jpg",
                      ),
                      Suggestion(
                        query: "Pollution",
                        url: "assets/images/pollution.jpg",
                      ),
                      Suggestion(
                        query: "Science",
                        url: "assets/images/science.jpg",
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}
