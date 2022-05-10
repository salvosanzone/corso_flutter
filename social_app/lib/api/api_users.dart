import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'package:social_app/models/user.dart';
import 'package:social_app/models/user_response.dart';


class ApiUser {

  static String get baseUrl => 'https://dummyapi.io/data/v1';

  // creo i metodi statici
  static Future<UserResponse> getUserList({int page = 0, int limit = 20}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user?page=$page&limit=$limit'),
      headers: {
        'app-id' : '626fc963e000f68286f05f20'
      }
    );

    print(response.body);

    // se va tutto bene stampo altrimenti stampo l'errore
    if(response.statusCode == 200) {
      return UserResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti ${response.body}');
  }


  // chiamate GET
  static Future<User> getDetails(String id) async {
    final response = await http.get(
        Uri.parse('$baseUrl/user/$id'),
        headers: {
          'app-id' : '626fc963e000f68286f05f20'
        }
    );

    print(response.body);

    if(response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere i dettagli dell utente ${response.body}');
  }






  // chiamate POST, gli passo il model Post
  /*static Future<User> addPost(User user) async {
    Map<String,dynamic> _newPost = user.toJson();
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
  }*/



  // chiamate PUT, gli passo il model Post
  static Future<User> editUser(User user, String id) async {
    Map<String,dynamic> _newUser = user.toJson();
    _newUser.removeWhere((key, value) => value == null);

    final http.Response response = await http.put(
        Uri.parse('$baseUrl/user/$id'),
        headers: {
          'app-id': '626fc963e000f68286f05f20',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(_newUser)
    );

    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(response.body));
    }

    throw Exception('Modifica post non riuscita: ${response.body}');
  }




  // chiamate DELETE
  /*static Future<bool> deletePost(String postId) async {
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
  }*/

}