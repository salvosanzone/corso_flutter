import 'package:flutter/material.dart';

class PostSs extends StatelessWidget {
  final String url_post;
  PostSs({required this.url_post});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3/2,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children:  [
          Image(
            image: AssetImage(url_post),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.filter_none, color: Colors.white, size: 15,),
          ),
        ],
      ),
    );
  }
}
