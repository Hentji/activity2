import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:activity2/models/user_models.dart';

class UserApiClient {
  final http.Client client;

  UserApiClient({required this.client});

  Future<List<UserModel>> fetchUsers() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Users');
    }
  }
}
