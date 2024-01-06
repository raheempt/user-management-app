

// import 'package:flutter/material.dart';

// class Authcontroller extends ChangeNotifier {
  

//   Future<e>
// }




import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management_app/constants.dart';

AuthController authController = AuthController();

class AuthController {
  static AuthController get instance => Get.find();
  final Rx<User?> _user = Rx<User?>(firebaseAuth.currentUser);
  User? get user => _user.value;
  final Rx<bool> _isAuthentctaing = Rx<bool>(false);
  bool get  isAuthentcating => _isAuthentctaing.value;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> signUpWithEmailAndPassword(
      String email, String password,) async {
    try {
      _isAuthentctaing.value = true;
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      _isAuthentctaing.value = false;
      return true;
      // UserCredential userCredential = await _auth
      //     .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      _isAuthentctaing.value = false;
      print('$e');
      return false;
    }
  }

  // Add methods for sign in, sign out, password reset, etc., similar to signUpWithEmailAndPassword
  // // For example:
  // Future<UserCredential?> signInWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return userCredential;
  //   } catch (e) {
  //     print('Error occurred during sign in: $e');
  //     return null;
  //   }
  // }

  Future<bool> register(String email, String password) async {
    try {
      _isAuthentctaing.value = false;
      return true;
    } catch (e) {
      _isAuthentctaing.value = false;
      print('$e');
      return false;
    }
  }

  signOut() async {
    await firebaseAuth.signOut();
  }

  // onAuthchanged(User? userf) {
  //   if (userf == null) {
  //     Navigator.pushNamed(context, '/LoginPage');
  //   } else {
  //     Navigator.pushNamed(context, '/HomePage');
  //   }
  // }

  // Implement signOut, resetPassword, or other necessary methods
}
