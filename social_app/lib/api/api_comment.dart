import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:social_app/models/comment.dart';
import 'package:social_app/models/comment_response.dart';


class ApiComment {

  static String get baseUrl => 'https://dummyapi.io/data/v1';

  // chaimate GET
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

  static Future<CommentResponse> getCommentsByPost(String id, {int page = 0, int limit = 20}) async {
    final response = await http.get(
        Uri.parse('$baseUrl/post/$id/comment?page=$page&limit=$limit'),
        headers: {
          'app-id' : '626fc963e000f68286f05f20'
        }
    );

    if(response.statusCode == 200) {
      return CommentResponse.fromJson(jsonDecode(response.body));
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


  // chiamate POST
  static Future<bool> addComment(String postId, String message) async {
    SharedPreferences ss = await SharedPreferences.getInstance();

    String? userId = ss.getString('idKey');

    if(userId == null) {
      throw Exception('Impossibile aggiungere un commento, non sei loggato');
    }

    final http.Response response = await http.post(
        Uri.parse('$baseUrl/comment/create'),
        headers: {
          'app-id': '626fc963e000f68286f05f20',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'owner': userId,
          'post': postId,
          'messsage': message,

        })
    );

    if(response.statusCode == 200){
      return true;
    }

    throw Exception('Commento non inserito: ${response.body}');
  }


  // chiamate DELETE
  static Future<Comment> deleteComment(String postId) async {
    SharedPreferences ss = await SharedPreferences.getInstance();

    String? userId = ss.getString('idKey');

    if(userId == null) {
      throw Exception('Impossibile eliminare un commento, non sei loggato');
    }

    final http.Response response = await http.delete(
        Uri.parse('$baseUrl/comment/$postId'),
        headers: {
          'app-id': '626fc963e000f68286f05f20',
          'Content-Type': 'application/json'
        },
    );

    if(response.statusCode == 200){
      return Comment.fromJson(jsonDecode(response.body));
    }

    throw Exception('Commento eliminato: ${response.body}');
  }




}