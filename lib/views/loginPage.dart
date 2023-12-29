
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_management_app/models/logintextfiled.dart';
import 'package:user_management_app/models/mybutto.dart';
import 'package:user_management_app/views/SingUp.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final Passwordcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  void singinuser()async{

    showDialog(context: context, builder: (context){
      return Center(child: CircularProgressIndicator(),);
    }
    );
    try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
    email:emailcontroller.text ,
    password: Passwordcontroller.text
    );
        Navigator.pop(context);

    }on FirebaseAuthException catch(e){
      
      if (e.code == 'user-not-found'){
      wrongemail();
      }else if (e.code == 'wrong- password '){
worngpassword();
      }
    }   
  }
 void wrongemail(){
  showDialog(context: context, builder: (context){
    return
  AlertDialog(title: Text('incorrect email'),);
  },);
 }
  void worngpassword(){
  showDialog(context: context, builder: (context){
    return
  AlertDialog(title: Text('incorrect password'),);
  },);
 }

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
                MyButton(
                  onTap: singinuser,
                ),
                   Padding(
                  padding: const EdgeInsets.symmetric(horizontal:28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [  
                      Text('Dont have an account?')  ,    
                           TextButton  (
              onPressed: () {
                // On signup success, navigate to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SingUpPage()),
                );
              },
              child: Text('Signup',
               style: TextStyle(color: Colors.blue)
              ),
            ),
                                    
                    ],
                  ),
                ),
                    SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('or continue with',
                        style: TextStyle(color: Colors.grey[700]),),
                      ),
                      Expanded(child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [       
                            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR68bCsdHavHCGhiv1gIOqZmJhOx1nc0jaDk4uqR7qGRA&s',height: 50,)  
                  ],
                ),
                       SizedBox(
                 height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a number?', style: TextStyle(color: Colors.green)),
                    SizedBox(width: 4,),
                    Text('Ragister now',
                    style: TextStyle(color: Colors.blue),)
                  ],
                )
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
