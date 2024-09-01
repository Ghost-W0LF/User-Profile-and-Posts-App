import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String name;
  String email;
  String profilePictureUrl;

  User({
    required this.name,
    required this.email,
    required this.profilePictureUrl,
  });
}

class UserProvider extends ChangeNotifier {
  List<User> userDetail = [
    User(
      email: 'Abhinab1221@gmail.com',
      name: "Abhinav K",
      profilePictureUrl: "assets/profile.jpeg",
    )
  ];

  UserProvider() {
    _loadUserData();
  }

  Future<void> updateUserData(String name, String email) async {
    userDetail[0].name = name;
    userDetail[0].email = email;
    await _saveUserData();
    notifyListeners();
  }

  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', userDetail[0].name);
    await prefs.setString('user_email', userDetail[0].email);
  }

  Future<void> updateProfilePicture(String imagePath) async {
    userDetail[0].profilePictureUrl = imagePath;
    await _saveProfilePicture(imagePath);
    notifyListeners();
  }

  Future<void> _saveProfilePicture(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_profile_picture', imagePath);
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userDetail[0].name = prefs.getString('user_name') ?? userDetail[0].name;
    userDetail[0].email = prefs.getString('user_email') ?? userDetail[0].email;
    userDetail[0].profilePictureUrl = prefs.getString('user_profile_picture') ??
        userDetail[0].profilePictureUrl;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
