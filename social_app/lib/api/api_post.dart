import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_app/models/post.dart';
import 'package:social_app/models/post_response.dart';


class ApiPost {

  static String get baseUrl => 'https://dummyapi.io/data/v1';

  // creo i metodi statici
  static Future<PostResponse> getPostList({int page = 0, int limit = 20}) async {
    final response = await http.get(
        Uri.parse('$baseUrl/post?page=$page&limit=$limit'),
        headers: {
          'app-id' : '626fc963e000f68286f05f20'
        }
    );

    print(response.body);


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
    print(response.body);



    if(response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere i dettagli dell utente ${response.body}');
  }

  static Future<Post> getPostByUser(String id) async {
    final response = await http.get(
        Uri.parse('$baseUrl/post/$id/post'),
        headers: {
          'app-id' : '626fc963e000f68286f05f20'
        }
    );

    if(response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere i dettagli dell utente ${response.body}');
  }


}