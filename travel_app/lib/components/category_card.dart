import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final IconData icona;
  final String text;
  final Color colore;
  const CategoryCard({Key? key, required this.icona, required this.text, required this.colore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              color: colore,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icona),
              ),
            ),
          ),
          Text(text),
        ],
      ),

    );
  }
}
