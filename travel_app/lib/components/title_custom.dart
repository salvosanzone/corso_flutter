import 'package:flutter/material.dart';

class TitleCustom extends StatelessWidget {
  final String text;
  const TitleCustom({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        text, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
