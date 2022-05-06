import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_app/models/post.dart';
import 'package:social_app/models/post_response.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ApiPost {

  static String get baseUrl => 'https://dummyapi.io/data/v1';

  // chiamate GET
  static Future<PostResponse> getPostList({int page = 0, int limit = 20}) async {
    final response = await http.get(
        Uri.parse('$baseUrl/post?page=$page&limit=$limit'),
        headers: {
          'app-id' : '626fc963e000f68286f05f20'
        }
    );

    //print(response.body);


    // se va tutto bene stampo altrimenti stampo l'errore
    if(response.statusCode == 200) {
      return PostResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti ${response.body}');
  }

  static Future<Post> getDetails(String id) async {
    final response = await http.get(
        Uri.parse('$baseUrl/post/$id'),
        headers: {
          'app-id' : '626fc963e000f68286f05f20'
        }
    );
    //print(response.body);



    if(response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere i dettagli dell utente ${response.body}');
  }

  static Future<PostResponse> getPostByUser(String id,{int page = 0, int limit = 20}) async {
    final response = await http.get(
        Uri.parse('$baseUrl/user/$id/post?page=$page&limit=$limit'),
        headers: {
          'app-id' : '626fc963e000f68286f05f20'
        }
    );

    if(response.statusCode == 200) {
      return PostResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere i dettagli dell utente ${response.body}');
  }



  // chiamate POST, gli passo il model Post
  static Future<Post> addPost(Post post) async {
    Map<String,dynamic> _newPost = post.toJson();
    _newPost.removeWhere((key, value) => value == null);

    final http.Response response = await http.post(
        Uri.parse('$baseUrl/post/create'),
        headers: {
          'app-id': '626fc963e000f68286f05f20',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({_newPost})
    );

    if(response.statusCode == 200){
      return Post.fromJson(jsonDecode(response.body));
    }

    throw Exception('Creazione post non riuscita: ${response.body}');
  }



  // chiamate PUT, gli passo il model Post
  static Future<Post> editPost(Post post, String id) async {
    Map<String,dynamic> _newPost = post.toJson();
    _newPost.removeWhere((key, value) => value == null);

    final http.Response response = await http.post(
        Uri.parse('$baseUrl/post/$id'),
        headers: {
          'app-id': '626fc963e000f68286f05f20',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({_newPost})
    );

    if(response.statusCode == 200){
      return Post.fromJson(jsonDecode(response.body));
    }

    throw Exception('Modifica post non riuscita: ${response.body}');
  }




  // chiamate DELETE
  static Future<bool> deletePost(String postId) async {
    SharedPreferences ss = await SharedPreferences.getInstance();

    String? userId = ss.getString('idKey');

    if(userId == null) {
      throw Exception('Impossibile eliminare un post, non sei loggato');
    }

    final http.Response response = await http.delete(
      Uri.parse('$baseUrl/post/$postId'),
      headers: {
        'app-id': '626fc963e000f68286f05f20',
        'Content-Type': 'application/json'
      },
    );

    if(response.statusCode == 200){
      return true;
    }

    throw Exception('Post eliminato: ${response.body}');
  }


}