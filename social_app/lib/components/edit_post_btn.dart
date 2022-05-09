import 'package:flutter/material.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/api/api_post.dart';

class EditPostBtn extends StatefulWidget {
  final Post post;
  const EditPostBtn({required this.post, Key? key}) : super(key: key);

  @override
  _EditPostBtnState createState() => _EditPostBtnState();
}

class _EditPostBtnState extends State<EditPostBtn> {

  late String _text;

  late Post _post = widget.post;
  late String _tag;
  late TextEditingController _textEditingControllerText;
  late TextEditingController _textEditingControllerTag;

  @override
  void initState() {

      _textEditingControllerText = TextEditingController(text: _post.text);
      //_tag = _post.tags?.join(', ') ?? '';
      //_textEditingControllerTag = TextEditingController(text: _tag);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () async {
        var updatePost = await showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 16, right: 16, bottom: 0
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _textEditingControllerText,
                      onChanged: (value) {
                        _text = _textEditingControllerText.text;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 16,
                                offset: Offset(4, 4), // Shadow position
                              ),
                            ],
                            image: const DecorationImage(
                              opacity: 0.9,
                              image: NetworkImage('http://www.blackelk.it/wp-content/uploads/2017/07/animali-selvatici-nelle-citt%C3%A0-BIG.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      //controller: _textEditingControllerTag,
                    ),
                    Row(
                      children: [
                        // se clicco annulla mi restituisce cio che avevo
                        TextButton(
                          child: const Text('Annulla'),
                          onPressed: () {
                              _textEditingControllerText.text = _post.text ?? '';
                              //_textEditingControllerTag.text = _post!.tags.toList() ?? '';
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Modifica'),
                          onPressed: () async {
                            if(_textEditingControllerText.text.isNotEmpty) {
                              User _userOne = const User(
                                id: "60d0fe4f5311236168a109ca",
                              );
                              _post = Post(
                                image: 'http://www.blackelk.it/wp-content/uploads/2017/07/animali-selvatici-nelle-citt%C3%A0-BIG.jpg',
                                text: _text,
                                tags: _tag.split(', '),
                                owner: _userOne,
                              );
                              if(_post == null) {
                                Navigator.of(context).pop();
                              }
                               else {
                                await ApiPost.editPost(_post, _post.id!);
                              }
                              Navigator.of(context).pop(true);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
        );
      },
    );
  }
}
