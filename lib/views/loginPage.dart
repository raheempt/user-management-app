

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_management_app/condroller/authcontroller.dart';
import 'package:user_management_app/models/logintextfiled.dart';
import 'package:user_management_app/views/SingUp.dart';
//   

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

AuthController authController = AuthController();

class _LoginPageState extends State<LoginPage> {
  
  final Passwordcontroller = TextEditingController();
  final emailcontroller = TextEditingController();

  // Future <void>signInWithGoogle(BuildContext context)async{
  //   try{
  //     final GoogleSingInAccount? googleuser= await GoogleSingIn().sigIn();

  //     final GoogleSingInAuthentiction?googleAuth=
  //     await googleuser?.authentiction;

  //     if(googleAuth?.accesessToken != null && googleAuth?.idToken !=null){
  //       final  Credential =GoogleAuthProvider.credential(
  //         accessToken: googleAuth?.accessToken,
  //         idToken: googleAuth?.idToken,
  //       );
  //       UserCredential userCredential =
  //       await _auth.singInWithCredantial(Credential);

  //     }

  //   }on FirebaseAuthException catch (e){
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message!)));
      
  //   }
  // }

//   Future<void> signInWithGoogle(BuildContext context) async {
//   try {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;

//     if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth!.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);

//       // You can handle the signed-in user here
//       // For example:
//       // User? user = userCredential.user;
//     }
//   } on FirebaseAuthException catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message!)));
//   } catch (e) {
//     print(e.toString());
//     // Handle other exceptions if needed
//   }
// }


// Future<UserCredential?>signInWithGoogle()async{
//   try{
//     final GoogleSignInAccount? googleUser =await GoogleSingIn().signIn();

//     final GoogleSignInAuthentication? googleAuth=await googleUser?.authentication;
//     final Credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken
//     );
//     return await FirebaseAuth.instance.signInWithCredential(Credential);   
//   }on FirebaseAuthException catch (e){
//     final ex = TExceptions.fromcode(e.code);
//     throw ex.message;
//   }catch(_){
//     const ex= TExceptions();
//     throw ex.message;
//   }
// }

// Future<UserCredential?> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//     if (googleAuth == null) {
//       throw TExceptions().message; // Handle the case where Google authentication fails
//     }

//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
    
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   } on FirebaseAuthException catch (e) {
//     final ex = TExceptions.fromCode(e.code);
//     throw ex.message;
//   } catch (_) {
//     throw TExceptions().message;
//   }
// }



// Future<Void>GgogleSingIn()async{
//   try{
//     isGoogleLoading.value = true;
//     await AuthenticationReposetory.instance.signInWithGoogle();
//     isGoogleLoading.value =false;
//   }catch (e){
//     isGoogleLoading.value = false;
//     print('');
//   }
// }




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
                
                // MyButton(
                //   onTap: login,
                //   if(emailco)
                // ),
Container(
  height: 50,width: 250,
    decoration: BoxDecoration(color: Colors.black,
        borderRadius: BorderRadius.circular(9)),
  child: ElevatedButton( 
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black12)
    ),
    onPressed: (){
      login();
      Navigator.pushNamed(context,
       '/HomePage');
    
    // if(emailcontroller.text.isNotEmpty && Passwordcontroller.text.length > 6){
    //     login();
    //     Navigator.pushNamed(context,
    //     '/HomePage');
    // } 
  },
   child: Text('LOG IN', style: TextStyle(color: Color.fromARGB(255, 236, 234, 234),
          fontWeight: FontWeight.bold,
          fontSize: 15),),),
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

  Future<void> login() async {
    // final auth = FirebaseAuth.instance;
   final result = await authController.signUpWithEmailAndPassword(emailcontroller.text, Passwordcontroller.text,);
   print(result);

   if (result != null) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something went wrong'), backgroundColor: Colors.red,));
   } else {
    print('Not Ok!');
   }

  // auth.signInWithEmailAndPassword(email: emailcontroller.text, password: Passwordcontroller.text);
    // if (!result) {
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something went wrong'), backgroundColor: Colors.red,),); 
    // }
  }
}


