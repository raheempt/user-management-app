
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_management_app/views/addlist.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  void singOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: singOut,
         icon: Icon(Icons.logout))
      ],),
      body: Center( child: Text('logid in '+user.email!),),  
           floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Addlist())),
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 7, 255, 48),
        ),
      ),
    );
  }
}