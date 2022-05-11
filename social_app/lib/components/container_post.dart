import 'package:flutter/material.dart';
import 'package:social_app/components/post_card.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/post_response.dart';
import 'package:social_app/api/api_post.dart';

class ContainerPost extends StatefulWidget {

  final String? userId;
  const ContainerPost({this.userId, Key? key}) : super(key: key);

  @override
  _ContainerPostState createState() => _ContainerPostState();
}

class _ContainerPostState extends State<ContainerPost> {
  // creo delle variabili di stato
  late List<Post> _listOfPost;
  late int _skipPosts;
  late bool _hasMorePosts;
  late Future<List<Post>> _future;
  late int _page;

  // creo la funzione initState() dove andrò ad inizializzare le variabili
  @override
  void initState() {
    super.initState();
    inizializeInitVariables();
  }

  // creo una funzione che andrà a recuperare gli users e ad aggiornare le variabili
  Future<List<Post>> _fetchPosts() async {
    late final PostResponse result;

    if(widget.userId != null) {
      result = await ApiPost.getPostByUser(widget.userId!, page: _page);
    }
    else {
      result = await ApiPost.getPostList(page: _page);
    }

    setState(() {
      // setto le variabili
      _skipPosts = _skipPosts + result.limit;
      _hasMorePosts = (result.total - _skipPosts > 0);
      _listOfPost = _listOfPost + result.data;
      _page++;
    });

    return _listOfPost;
  }

// creo una funzione che inizializza le variabili per non farlo due volte dentro initState e setState
  void inizializeInitVariables() {
    _listOfPost = [];
    _hasMorePosts = false;
    _skipPosts = 0;
    _page = 0;
    _future = _fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        setState(() {
          inizializeInitVariables();
        });
        return Future.value();
      },
      child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            // snapshot è il contenuto del future in un determinato momento
            if (snapshot.hasData && snapshot.data is List<Post>) {
              //salvo in listUsers tutti i post che passerò all'attributo post
              List<Post> listPost = snapshot.data as List<Post>;

              return ListView.builder(
                  itemCount: listPost.length + (_hasMorePosts ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == _listOfPost.length) {
                      _future = _fetchPosts();

                      // per far capire che ci sono altri post che stanno caricando
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    // restituisco la lista di post

                    /*ho creato questa variabile perche il FutureBilder lo faccio qui
                    ma il widget PostCard è da un'altra parte*/
                    return PostCard(post: listPost[index], refreshEditing: inizializeInitVariables,);
                  });
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
