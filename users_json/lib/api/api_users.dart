import 'dart:convert';

import 'package:users_json/models/users_response.dart';
import 'package:http/http.dart' as http;

class ApiUsers {
  static Future<UsersResponse> getUsersFromInternet() async {

    final response = await http.get(Uri.parse('https://dummyjson.com/users'));

    if(response.statusCode == 200) {
      return UsersResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception('Errore !!! ${response.statusCode} - ${response.reasonPhrase}');

  }
}