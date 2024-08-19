import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recruitment_assignment/models/post_model.dart';

Future<List<userPost>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => userPost.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
