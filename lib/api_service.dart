import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://example-api.com";

  Future<List<dynamic>> fetchPosts() async {
    // Add a language parameter if the API supports it
    final response = await http.get(Uri.parse('$baseUrl/posts?lang=en'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load posts");
    }
  }
}
