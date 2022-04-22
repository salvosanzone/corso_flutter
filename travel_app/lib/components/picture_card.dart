import 'package:flutter/material.dart';

class PictureCard extends StatelessWidget {
  final String urlPic;
  const PictureCard(this.urlPic, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(urlPic),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
