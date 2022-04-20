import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final String text;
  final double size;
  final double size_inset;
  final String url_stories;

  Stories({
    required this.size,
    required this.size_inset,
    this.text = '',
    required this.url_stories
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 2),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: size_inset,
                height: size_inset,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(url_stories),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
           Text(text),
        ],
      ),
    );
  }
}
