import 'package:activity2/models/to_do_list.dart';
import 'package:flutter/material.dart';
import 'user_models.dart';

class UserDetailsPage extends StatelessWidget {
  final UserModel user;

  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserDetail('Name', user.name),
            _buildUserDetail('Username', user.username),
            _buildUserDetail('Email', user.email),
            _buildUserDetail('Phone', user.phone),
            _buildUserDetail('Website', user.website),
            const SizedBox(height: 20),
            _buildAddressDetails(user.address),
            const SizedBox(height: 20),
            _buildCompanyDetails(user.company),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ToDoListPage()),
                  );
                },
                child: const Text('Show Todos'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildUserDetail(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$label:',
      ),
      const SizedBox(height: 4),
      Text(
        value,
      ),
      const SizedBox(height: 10),
    ],
  );
}

Widget _buildAddressDetails(Address address) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Address:',
      ),
      const SizedBox(height: 4),
      Text(
        '${address.street}, ${address.suite}, ${address.city}',
      ),
      const SizedBox(height: 4),
      Text(
        'Zip: ${address.zipcode}',
      ),
      const SizedBox(height: 4),
      Text(
        'Lat: ${address.geo.lat}',
      ),
      const SizedBox(height: 4),
      Text(
        'Lng: ${address.geo.lng}',
      ),
      const SizedBox(height: 10),
    ],
  );
}

Widget _buildCompanyDetails(Company company) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Company:',
      ),
      const SizedBox(height: 4),
      Text(
        company.name,
      ),
      const SizedBox(height: 4),
      Text(
        '"${company.catchPhrase}"',
      ),
      const SizedBox(height: 4),
      Text(
        ' bs: ${company.bs}',
      ),
      const SizedBox(height: 10),
    ],
  );
}
