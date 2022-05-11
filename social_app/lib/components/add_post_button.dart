import 'package:flutter/material.dart';
import 'package:social_app/api/api_post.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/models/post.dart';

class AddPostButton extends StatefulWidget {
  final Function callBack;
  const AddPostButton({required this.callBack, Key? key}) : super(key: key);

  @override
  _AddPostButtonState createState() => _AddPostButtonState();
}

class _AddPostButtonState extends State<AddPostButton> {

  late Post _post;
  late String _text;
  late String _tag;
  late TextEditingController _textEditingControllerText;
  late TextEditingController _textEditingControllerTag;


  @override
  void initState() {
    _textEditingControllerText = TextEditingController();
    _textEditingControllerTag = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 20,
        child: const Icon(Icons.add, color: Colors.white,),
        onPressed: () async {
          var popResult = await showModalBottomSheet(
              context: context,
              isScrollControlled : true,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: 16, left: 16, right: 16, bottom: MediaQuery.of(context).viewInsets.bottom
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _textEditingControllerText,
                        onChanged: (value) {
                          _text = _textEditingControllerText.text;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Scrivi un testo al post',
                            icon: Icon(Icons.create)
                        ),
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
                        onChanged: (value) {
                          _tag = _textEditingControllerTag.text;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Aggiungi dei hastag',
                            icon: Icon(Icons.tag)
                        ),
                      ),
                      Row(

                        children: [
                          TextButton(
                            child: const Text('Annulla'),
                            onPressed: () {
                              _textEditingControllerTag.clear();
                              _textEditingControllerText.clear();
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Pubblica'),
                            onPressed: () async {
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
                              await ApiPost.addPost(_post);
                              _text = '';
                              _tag = '';
                              _textEditingControllerText.clear();
                              _textEditingControllerTag.clear();
                              Navigator.of(context).pop(true);
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
            setState(() {
              inizializeVariables();
            });
          }
        }
    );
  }
}
