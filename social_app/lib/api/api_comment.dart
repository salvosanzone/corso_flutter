import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_app/models/comment.dart';
import 'package:social_app/models/comment_response.dart';


class ApiComment {

  static String get baseUrl => 'https://dummyapi.io/data/v1';

  // creo i metodi statici
  static Future<CommentResponse> getCommentList({int page = 0, int limit = 20}) async {
    final response = await http.get(
        Uri.parse('$baseUrl/comment?page=$page&limit=$limit'),
        headers: {
          'app-id' : '626fc963e000f68286f05f20'
        }
    );

    // se va tutto bene stampo altrimenti stampo l'errore
    if(response.statusCode == 200) {
      return CommentResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti ${response.body}');
  }

  static Future<Comment> getCommentsByPost(String id) async {
    final response = await http.get(
        Uri.parse('$baseUrl/post/$id/comment'),
        headers: {
          'app-id' : '626fc963e000f68286f05f20'
        }
    );

    if(response.statusCode == 200) {
      return Comment.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere i dettagli dell utente ${response.body}');
  }

  static Future<Comment> getCommentsByUser(String id) async {
    final response = await http.get(
        Uri.parse('$baseUrl/user/$id/comment'),
        headers: {
          'app-id' : '626fc963e000f68286f05f20'
        }
    );

    if(response.statusCode == 200) {
      return Comment.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere i dettagli dell utente ${response.body}');
  }


}