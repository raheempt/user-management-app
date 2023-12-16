
import 'package:flutter/material.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:user_management_app/models/logintextfiled.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final usernamecontroller = TextEditingController();
  final Passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              // logo
              Icon(
                Icons.apple,
                size: 100,
              ),

              SizedBox(
                height: 20,
              ),

              // welcome back, you've been missed!

              Text(
                ' welcome back, you\'ve been missed',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                ),
              ),

              SizedBox(
                height: 15,
              ),

           loginTextField(
            condroller: usernamecontroller,
            hintText: 'username',
            obscureText: false,
           ),
             
          loginTextField(
            condroller:Passwordcontroller ,
            hintText: 'password',
            obscureText: true,
          ),
            SizedBox(
                height: 10,
              ),
              Text('Forgot password?'),
            ],
          ),
        ),
      ),
    );
  }
}
