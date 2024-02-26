import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:activity2/models/user_models.dart';
import 'package:activity2/models/user_details.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late Future<List<UserModel>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _futureUsers = fetchUsers();
  }

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.3:3001/users")); //change this part to your ip address

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => UserModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                UserModel user = snapshot.data![index];
                return ListTile(
                  title: Text(user.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailsPage(user: user),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
