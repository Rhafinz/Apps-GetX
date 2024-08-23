import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/user_model.dart';

class ShowUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataUser user = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.deepPurple[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama User: ${user.name}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Email: ${user.email}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Password: ${user.password}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Created At: ${user.createdAt}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Updated At: ${user.updatedAt}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}