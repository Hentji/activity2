import 'package:flutter/material.dart';
import 'package:activity2/models/to_do_list.dart';
import 'user_models.dart'; // Make sure this path matches where your UserModel is located

class UserDetailsPage extends StatelessWidget {
  final UserModel user;

  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${user.name}',
                    ),
                    const SizedBox(height: 8),
                    Text('Username: ${user.username}'),
                    const SizedBox(height: 8),
                    Text('Email: ${user.email}'),
                    const SizedBox(height: 8),
                    Text('Phone: ${user.phone}'),
                    const SizedBox(height: 8),
                    Text('Website: ${user.website}'),
                    const SizedBox(height: 8),
                    const Text(
                      'Address:',
                    ),
                    Text('${user.address.street}, ${user.address.suite}'),
                    Text('${user.address.city}, ${user.address.zipcode}'),
                    const SizedBox(height: 8),
                    const Text(
                      'Company:',
                    ),
                    Text(user.company.name),
                    Text(user.company.catchPhrase),
                    Text(user.company.bs),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the To Do List page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ToDoListPage()),
                  );
                },
                child: const Text('Things to Do'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
