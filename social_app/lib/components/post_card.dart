import 'package:flutter/material.dart';
import 'package:social_app/models/post.dart';
import 'package:intl/intl.dart';
import 'package:social_app/pages/comments_page.dart';
import 'package:social_app/pages/my_posts.dart';
import 'package:social_app/pages/profile_page.dart';
import 'package:social_app/components/edit_post_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PostCard extends StatelessWidget {
  // creo una variabile di tipo Post
  final Post post;

  // gli passo la classe Post e lo salvo in una variabile
  const PostCard({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (post.publishDate != null) {
      // trasformo da stringa a DateTime
      final _data = DateTime.parse(post.publishDate!);
      print(
          // trasformo da DateTime a stringa nel formato che preferisco
          DateFormat('d/M/y HH:mm').format(_data));
    }
    return Padding(
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
                           GestureDetector(
                            onTap: () {
                              print('cliccato');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProfilePage(giveMeId: post.owner.id!),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 36,
                              backgroundImage: NetworkImage(
                                  post.owner.picture ??
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
                                        return MyPosts(giveMeId: post.owner.id!,);
                                      },
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    '${post.owner.firstName} ${post.owner.lastName }',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              post.publishDate ?? '',
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
                              image: NetworkImage(post.image),
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
                  "'${post.text}'",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),

                // posso usare questo if ma senza le graffe
                if (post.tags != null)
                  Wrap(
                    spacing: 6,
                    children: post.tags
                        .map((tag) => Chip(
                            elevation: 8,
                            backgroundColor: Colors.yellow.shade700,
                            padding: const EdgeInsets.all(8),
                            shadowColor: Colors.black,
                            label: Text(
                              '#${tag}',
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
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        Text(' ${post.likes}'),
                      ],
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) {
                              return CommentsPage(giveMeIdPost: post.id!);
                            }
                        ),
                        );
                      },
                      child: const Text('Commenti'),
                    ),
                    EditPostBtn(post: post,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
