import 'package:flutter/material.dart';
import 'package:social_app/api/api_post.dart';
import 'package:social_app/components/like_button.dart';
import 'package:social_app/models/post.dart';
import 'package:intl/intl.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/pages/comments_page.dart';
import 'package:social_app/pages/my_posts.dart';
import 'package:social_app/pages/profile_page.dart';
import 'package:social_app/components/edit_post_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PostCard extends StatefulWidget {
  // creo una variabile di tipo Post
  final Post post;
  final User? user;
  final Function refreshEditing;
  // gli passo la classe Post e lo salvo in una variabile
  const PostCard({required this.refreshEditing, this.user, required this.post, Key? key}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  String? _userId;
  late bool _deleted;


  // salvo all'interno di _userId, l'id dell'utente loggato
  Future<void> _initIdUser() async {
    SharedPreferences ss = await SharedPreferences.getInstance();
    setState(() {
      _userId = ss.getString('idKey');
    });

    print('-----> $_userId');

  }

  @override
  void initState() {
    _initIdUser();
    _deleted = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if (widget.post.publishDate != null) {
      // trasformo da stringa a DateTime
      final _data = DateTime.parse(widget.post.publishDate!);
          // trasformo da DateTime a stringa nel formato che preferisco
          DateFormat('d/M/y HH:mm').format(_data);
    }


    return Visibility(
      visible: !_deleted,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: Colors.black.withOpacity(0.2),
                width: 1,
              ),
            ),
            shadowColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          children: [
                            // al click del profilo gli passo l'id personale come parametro
                            if(widget.post.owner.id != null)
                             GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProfilePage(giveMeId: widget.post.owner.id!),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 36,
                                backgroundImage: NetworkImage(
                                    widget.post.owner.picture ??
                                        "https://via.placeholder.com/150"),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    //print('click');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MyPosts(giveMeId: widget.post.owner.id!,);
                                        },
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      '${widget.post.owner.firstName} ${widget.post.owner.lastName }',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                widget.post.publishDate ?? '',
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        if(widget.post.image != null)
                        AspectRatio(
                          aspectRatio: 3 / 2,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 4,
                                  offset: Offset(4, 4), // Shadow position
                                ),
                              ],
                              image: DecorationImage(
                                opacity: 0.9,
                                image: NetworkImage(widget.post.image!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 3 / 2,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "'${widget.post.text}'",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // posso usare questo if ma senza le graffe
                    if(widget.post.tags != null)
                    Wrap(
                      spacing: 6,
                      children: widget.post.tags!
                          .map((tag) => Chip(
                              elevation: 8,
                              backgroundColor: Colors.yellow.shade700,
                              padding: const EdgeInsets.all(8),
                              shadowColor: Colors.black,
                              label: Text(
                                '#$tag',
                                style: const TextStyle(color: Colors.white),
                              )))
                          .toList(),
                    ),
                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if(widget.post.id != null) LikeButton(widget.post, widget.post.id!),

                        ],
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) {
                                    return CommentsPage(giveMeIdPost: widget.post.id!);
                                  }
                              ),
                              );
                            },
                            child: const Text('Commenti'),
                          ),

                          if(_userId == widget.post.owner.id)
                          EditPostBtn(post: widget.post,callBack: widget.refreshEditing),

                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async {
                              late bool result;
                              if(widget.post.id != null) {
                                result = await ApiPost.deletePost(widget.post.id!);
                              }
                              if(result == true) {
                                setState(() {
                                  _deleted = true;
                                });
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      title: const Center(child: Text('Post eliminato')),
                                      actions: [
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () => Navigator.of(context).pop()
                                        )
                                      ],
                                    )
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
