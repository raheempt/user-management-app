import 'package:flutter/material.dart';
import 'package:user_management_app/models/logintextfiled.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final namecontroller = TextEditingController();
  final Passwordcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color.fromARGB(226, 221, 220, 220),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                // logo
                Icon(
                  Icons.apple,
                  size: 100,
                ),
          
                SizedBox(
                  height: 10,
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
                  height: 10,
                ),
                 loginTextField(
              condroller: namecontroller,
              hintText: 'name',
              obscureText: false,
             ),
          
             loginTextField(
              condroller: emailcontroller,
              hintText: 'email',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                   
                           ElevatedButton  (
              onPressed: () {
                // On signup success, navigate to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SingUpPage()),
                );
              },
              child: Text('SingUp',
              ),
            ),
                                    
                    ],
                  ),
                ),
              
                // MyButton(
                //   onTap: singinuser,
                // ),
            
              
           
                
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}