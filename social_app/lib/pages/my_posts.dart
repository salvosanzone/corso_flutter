import 'package:flutter/material.dart';
import 'package:social_app/pages/home.dart';

class MyPosts extends StatefulWidget {
  // creo una variabile che contenga l'id che gli passo al click
  final String giveMeId;

  const MyPosts({required this.giveMeId, Key? key}) : super(key: key);

  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('MyPost'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white,),
        ),
      ),
      body: Home(active: false, userId: widget.giveMeId),
    );
  }
}
