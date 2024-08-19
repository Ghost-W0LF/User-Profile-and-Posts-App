import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruitment_assignment/models/userModel.dart';


// Make the function public by removing the underscore
Future<void> pickImage(BuildContext context, UserProvider userProvider) async {
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