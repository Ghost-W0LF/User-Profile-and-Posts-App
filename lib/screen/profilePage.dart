import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:recruitment_assignment/models/userModel.dart';
import 'package:recruitment_assignment/screen/postPage.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Consumer<UserProvider>(
          builder: (context, usr, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => _pickImage(context, usr),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: usr.userDetail[0].profilePictureUrl
                              .startsWith('assets')
                          ? AssetImage(usr.userDetail[0].profilePictureUrl)
                              as ImageProvider
                          : FileImage(
                              File(usr.userDetail[0].profilePictureUrl)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    usr.userDetail[0].name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(usr.userDetail[0].email,
                      style: const TextStyle(fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _showEditDialog(context, usr);
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
        ));
  }

  Future<void> _pickImage(
      BuildContext context, UserProvider userProvider) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        await userProvider.updateProfilePicture(pickedFile.path);
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }
}

void _showEditDialog(BuildContext context, UserProvider userProvider) {
  final nameController =
      TextEditingController(text: userProvider.userDetail[0].name);
  final emailController =
      TextEditingController(text: userProvider.userDetail[0].email);

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
              decoration: const InputDecoration(labelText: 'Name'),
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
            onPressed: () async {
              // Update the values in the userDetail list
              await userProvider.updateUserData(
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
