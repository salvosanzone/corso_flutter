import 'dart:convert';

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
        'app-id' : '626fb4964f880848738786a4'
      }
    );

    // se va tutto bene stampo altrimenti stampo l'errore
    if(response.statusCode == 200) {
      return UserResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti ${response.body}');
  }


  // in questo caso passo un altro argomento che è l'id
  static Future<User> getDetails(String id) async {
    final response = await http.get(
        Uri.parse('$baseUrl/user/$id'),
        headers: {
          'app-id' : '626fb4964f880848738786a4'
        }
    );

    if(response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere i dettagli dell utente ${response.body}');
  }

}