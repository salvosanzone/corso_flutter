import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_app/models/tag.dart';
import 'package:social_app/models/tag_response.dart';


class ApiPost {

  static String get baseUrl => 'https://dummyapi.io/data/v1';

  // creo i metodi statici
  static Future<TagResponse> getTagList({int page = 0, int limit = 20}) async {
    final response = await http.get(
        Uri.parse('$baseUrl/tag?page=$page&limit=$limit'),
        headers: {
          'app-id' : '626fc963e000f68286f05f20'
        }
    );

    // se va tutto bene stampo altrimenti stampo l'errore
    if(response.statusCode == 200) {
      return TagResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti ${response.body}');
  }


  static Future<Tag> getPostsPerTag(String tags) async {
    final response = await http.get(
        Uri.parse('$baseUrl/tag/$tags/post'),
        headers: {
          'app-id' : '626fc963e000f68286f05f20'
        }
    );

    if(response.statusCode == 200) {
      return Tag.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere i dettagli dell utente ${response.body}');
  }


}