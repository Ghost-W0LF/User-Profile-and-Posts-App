import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recruitment_assignment/models/userModel.dart';
import 'package:recruitment_assignment/screen/postPage.dart';
import 'package:recruitment_assignment/service/imagePicker.dart';

import 'dart:io';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GestureDetector(
                  onLongPress: () => pickImage(context, userProvider),
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: userProvider
                            .userDetail[0].profilePictureUrl
                            .startsWith('asset')
                        ? AssetImage(
                            userProvider.userDetail[0].profilePictureUrl)
                        : FileImage(
                            File(userProvider.userDetail[0].profilePictureUrl)),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  userProvider.userDetail[0].name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(userProvider.userDetail[0].email,
                    style: const TextStyle(fontSize: 18, color: Colors.grey)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showEditDialog(context, userProvider);
                      },
                      child: const Text('Edit Profile'),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostPage(),
                          ),
                        );
                      },
                      child: const Text('View Posts'),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, UserProvider userProvider) {
    final emailController =
        TextEditingController(text: userProvider.userDetail[0].email);

    final nameController =
        TextEditingController(text: userProvider.userDetail[0].name);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'User Name'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Update the values in the userDetail list
                userProvider.updateUserData(
                  nameController.text,
                  emailController.text,
                );

                // Close the dialog
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
