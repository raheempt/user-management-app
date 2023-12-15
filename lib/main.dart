import 'package:flutter/material.dart';
import 'package:user_management_app/views/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'user management app',
  home: LoginPage(),
    );
  }
}

