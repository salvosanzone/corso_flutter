import 'package:flutter/material.dart';

class TextAlertDialog extends StatelessWidget {
  final String text;
  const TextAlertDialog({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
      ),
    );
  }
}
