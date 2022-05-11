import 'package:flutter/material.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/api/api_post.dart';

class EditPostBtn extends StatefulWidget {
  final Post post;
  final Function callBack;
  const EditPostBtn({required this.callBack, required this.post, Key? key}) : super(key: key);

  @override
  _EditPostBtnState createState() => _EditPostBtnState();
}

class _EditPostBtnState extends State<EditPostBtn> {


  late Post _post = widget.post;
  late TextEditingController _textEditingControllerText;
  late TextEditingController _textEditingControllerTag;

  @override
  void initState() {

      _textEditingControllerText = TextEditingController(text: _post.text);
      String? _tag = _post.tags?.join(', ');
      _textEditingControllerTag = TextEditingController(text: _tag);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () async {
        var popResult = await showModalBottomSheet(
            isScrollControlled : true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: MediaQuery.of(context).viewInsets.bottom
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _textEditingControllerText,
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
                      controller: _textEditingControllerTag,
                    ),
                    Row(
                      children: [
                        // se clicco annulla mi restituisce cio che avevo
                        TextButton(
                          child: const Text('Annulla'),
                          onPressed: () {
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
                                text: _textEditingControllerText.text,
                                tags: _textEditingControllerTag.text.split(', '),
                                owner: _userOne,
                              );
                                await ApiPost.editPost(_post, widget.post.id!);
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
        if(popResult == true) {
          widget.callBack();
        }
      },
    );
  }
}
