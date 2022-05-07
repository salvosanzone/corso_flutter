
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/api/api_comment.dart';
import 'package:social_app/models/comment_response.dart';
import 'package:social_app/models/comment.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/models/post.dart';
class CommentsPage extends StatefulWidget {

  // creo una variabile che conterrà l'id del post
  final String giveMeIdPost;


  // creo una variabile di tipo Comment

  const CommentsPage({required this.giveMeIdPost, Key? key}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  // creo le variabili di stato
  late List<Comment> _listOfComments;
  late int _skipComments;
  late bool _hasMoreComments;
  late Future<List<Comment>> _future;
  late int _page;

  late TextEditingController _textEditingController;
  String? _message;
  late String? _idUtente;
  late String _idPost;

  Future<void> _initUtente() async {
    SharedPreferences ss = await SharedPreferences.getInstance();
    _idUtente = ss.getString('idKey');

    if(_idUtente == null) {
      throw Exception('utente non laggato');

    }
  }

  @override
  void initState() {
    inizializeVariables();
    _initUtente();
    _textEditingController = TextEditingController();
    _idPost = widget.giveMeIdPost;
    super.initState();
  }

  // questa funzione mi restituisce la lista dei commenti
  Future<List<Comment>> _fetchComments() async {
    // chiamata effettiva che noi facciamo ad internet ed è dentro result, il risultato della chiamata
    final result = await ApiComment.getCommentsByPost(widget.giveMeIdPost, page: _page);

    print('risultato: $result');

    setState(() {
      _skipComments = _skipComments + result.limit;
      _hasMoreComments = (result.total - _skipComments) > 0;
      _listOfComments = _listOfComments + result.data;
      _page++;
    });


    return _listOfComments;
  }

  // creo una funzione che inizializza le variabili
  void inizializeVariables() {
    _listOfComments = [];
    _hasMoreComments = false;
    _skipComments = 0;
    _page = 0;
    _future = _fetchComments();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'MyComments', style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pushNamed('/home'),
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white,),
        ),
      ),

      // FutureBuilder mi restituisce ListView.builder
      body: FutureBuilder(
        future: _future,
        builder: (context, AsyncSnapshot<List<Comment>>snapshot) {
          if (snapshot.hasData) {

            var comment = snapshot.data;


            //print('commenti: $comment');

            // questa funzione restituisce la lista dei post
            return ListView.builder(
              itemCount: _listOfComments.length + (_hasMoreComments ? 1 : 0),
              itemBuilder: (context, index) {


                // se sono all'ultimo commento gli faccio capire all'utente che ce n'è un altro
                if(index == _listOfComments.length) {
                  _future = _fetchComments();

                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                }
                // ciò che la ListView.builder mi restituisce
                return Padding(
                  padding: const EdgeInsets.all(16.0),
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
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 36,
                                backgroundImage: NetworkImage(
                                  comment?[index].owner.picture ?? '',
                                    ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          '${comment?[index].owner.firstName} ${comment?[index].owner.lastName}',
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0),
                            child: Text(
                                comment?[index].message ?? '',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          if(snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );

        }),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          var popResult = await showModalBottomSheet(
              context: context,
              isScrollControlled : true,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: MediaQuery.of(context).viewInsets.bottom
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _textEditingController,
                        maxLines: 5,
                        onChanged: (value) {
                          _message = _textEditingController.text;
                        },
                      ),
                      Row(
                        children: [
                          TextButton(
                            child: const Text('Annulla'),
                            onPressed: () {
                              _message = null;
                              _textEditingController.clear();
                              Navigator.of(context).pop();
                            }
                          ),
                          TextButton(
                            child: const Text('Pubblica'),
                            onPressed: () async {
                              if(_message == null || _message!.isEmpty) {
                                Navigator.of(context).pop();
                              }
                              final response = await ApiComment.addComment(_idPost, _message!);
                              print('risposta $response');
                              _message = null;
                              _textEditingController.clear();

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
        },
      ),
    );
  }
}
