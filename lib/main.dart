import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:recruitment_assignment/models/userModel.dart';
import 'package:recruitment_assignment/screen/profilePage.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Developer Assignment',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProfilePage(),
      ),
    );
  }
}
