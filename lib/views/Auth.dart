
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_management_app/views/home.dart';
import 'package:user_management_app/views/loginPage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshort){
        
        if (snapshort.hasData){
          return HomePage();
        }
        else{
          return LoginPage();
        }
        }),
        
    );
  }
}