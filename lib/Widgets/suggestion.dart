import 'package:flutter/material.dart';
import 'package:simple_news_app/Views/posts_view.dart';

class Suggestion extends StatefulWidget {
  final String query;
  final String url;

  const Suggestion({required this.query, required this.url, Key? key})
      : super(key: key);

  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -0.01, end: 0.01).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            image: AssetImage(widget.url),
            fit: BoxFit.cover,
          ),
        ),
        margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: SizedBox(
          height: 75,
          width: 350,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostView(
                    query: widget.query,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                // Implement the stroke
                Text(
                  widget.query,
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 3,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1
                      ..color = Colors.black,
                  ),
                ),
                // The text inside
                Text(
                  widget.query,
                  style: const TextStyle(
                    fontSize: 24,
                    letterSpacing: 3,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
