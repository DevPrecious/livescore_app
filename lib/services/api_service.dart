import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:scoreapp/constants/constant.dart';

class ApiService {
  final String baseUrl = apiUrl;

  Future<dynamic> get(String endpoint) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'x-rapidapi-key': apiKey,
        },
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception('HTTP Error: ${response.statusCode}');
    }
  }
}
