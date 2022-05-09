import 'package:flutter/material.dart';
import 'package:social_app/api/api_post.dart';
import 'package:social_app/models/post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/models/user.dart';

class LikeButton extends StatefulWidget {
  final Post post;
  final String userIdLoggated;
  const LikeButton(this.post, this.userIdLoggated, {Key? key})
      : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _withLike = false;
  late int _countLike;
  late List<String> _likeList;
  late SharedPreferences _ss;

  initLike() async {
    final ss = await SharedPreferences.getInstance();
    final likeList = ss.getStringList('like_${widget.userIdLoggated}') ?? [];

    setState(() {
      _withLike = likeList.contains(widget.post.id);
      _likeList = likeList;
      _ss = ss;
    });
  }

  void addOrRemoveLike() async {
    _withLike
        ? _likeList.remove(widget.post.id)
        : _likeList.add(widget.post.id!);

    await _ss.setStringList('like_${widget.userIdLoggated}', _likeList);

    _withLike ? _countLike-- : _countLike++;

    await ApiPost.editPost(
        Post(
            id: widget.post.id,
            likes: _countLike,
            owner: User()),
        widget.userIdLoggated);

    setState(() {
      _withLike = !_withLike;
    });
  }

  @override
  void initState() {
    _countLike = widget.post.likes ?? 0;
    initLike();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: addOrRemoveLike,
        icon: Icon(_withLike ? Icons.favorite : Icons.favorite_outline),
        label: Text(_countLike.toString()));
  }
}
