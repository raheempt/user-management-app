import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              // logo
              Icon(Icons.lock, size: 100,),
             
                SizedBox(height: 50,),

                // welcome back, you've been missed!

                Text(' welcome back, you\'ve been missed',
                style:TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                ) ,),
                
           SizedBox(height: 25,),


            ],
          ),
        ),
      ),

    );
  }
}