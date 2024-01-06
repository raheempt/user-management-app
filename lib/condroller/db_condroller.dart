// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/firebase.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:user_management_app/condroller/authcontroller.dart';

// class StudentData extends ChangeNotifier{
//   static StudentData instance = Get.find();




//   getData(){
//    User? userId = FirebaseAuth.instance.currentUser;
//  final data=   FirebaseFirestore.instance
//         .collection("notes")
//         .where("userId", isEqualTo: userId?.uid)
//         .snapshots();
//        return data;
//   }

// // getData() {} async{
// //   try {
// //     final ref = FirebaseFirestore.instance.collection('notes').doc(authController.user!.uid).collection('todos').doc();
// //   }
// // }

//   void addData(String name, String age, String email, String contact,
//       ) async {
//     User? currentUser = FirebaseAuth.instance.currentUser;
//     FirebaseFirestore.instance.collection("notes").doc().set(
//       {
//         "Name": name,
//         "Age": age,
//         "Email": email,
//         "contact": contact,
//         "userId": currentUser?.uid,
//       },
//     );
//   }

//     void upDatedata(
//     dynamic studentId,
//     TextEditingController name,
//     TextEditingController email,
//     TextEditingController age,
//     TextEditingController contact,
//   ) {
//     final CollectionReference userdata =
//         FirebaseFirestore.instance.collection('notes');
//     final DATA = {
//       'Name': name.text,
//       'Age': age.text,
//       'Email': email.text,
//       'contact': contact.text,
//     };
//     userdata.doc(studentId).update(DATA);
//   }

//   final students = FirebaseFirestore.instance.collection('notes');
//   void delete(docid) {
//     students.doc(docid).delete();
//   }



// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management_app/constants.dart';
import 'package:user_management_app/models/todo.dart';
import 'package:user_management_app/views/loginPage.dart';

class HomeController extends ChangeNotifier {
  static HomeController instance = Get.find();
  addTodo(String name, String age, String email, String contact) async{
    try {
      final ref = firestore.collection('notes').doc(authController.user!.uid).collection('user').doc();
      final todo = Todo(
        id: ref.id,
        name: name,
        age: age,
        email: email,
        contact: contact
      );
      await ref.set(todo.toMap());
    }catch (e) {
      print('something went wrong(Add) : $e');
    }
  }

  updateTodo(String id, Todo todo, TextEditingController emailController, TextEditingController ageController, TextEditingController phoneController) async {
    try {
      await firestore.collection('notes').doc(authController.user!.uid).collection('user').doc(id).update(todo.toMap());
    } catch (e) {
      print('something went wrong(Update) : $e');
    }
  }

  deleteTodo(String id)  async{
    try {
      await firestore.collection('notes').doc(authController.user!.uid).collection('user').doc(id).delete();
    } catch (e) {
      print('Something went wrong(Delete): $e');
    }
  }
}