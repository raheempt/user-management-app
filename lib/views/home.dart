
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/condroller/authcontroller.dart';
import 'package:user_management_app/condroller/db_condroller.dart';
import 'package:user_management_app/constants.dart';
import 'package:user_management_app/views/addlist.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser;

  void singOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {
          singOut();
          // singOut();
          Navigator.pushNamed(context,
          '/LoginPage'
          );
        },
         icon: Icon(Icons.logout))
      ],),
       body: Container(
        color: Color.fromARGB(255, 202, 209, 204),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Consumer<HomeController>(
              builder: (BuildContext context, studentData, child) {
                return StreamBuilder(
                  stream: firestore.collection('notes').doc(authController.user!.uid).collection('user').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return Text('Error occurred');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No Data Found'));
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final studentData = snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                            left: 10.0,
                            top: 5.0,
                          ),
                          child: Card(
                            color: Color.fromARGB(234, 200, 207, 202),
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/update',
                                  arguments: {
                                    'Name': studentData['Name'],
                                    'Age': studentData['Age'],
                                    'Email': studentData['Email'],
                                     'contact': studentData['contact'],
                                    'id': studentData.id,
                                  },
                                );
                              },
                              trailing: IconButton(
                                onPressed: () {
                                  Provider.of<HomeController>(context,
                                          listen: false)
                                      .deleteTodo(studentData.id);
                                },
                                icon: Icon(Icons.delete),
                              ),
                              title: Text(
                                studentData['Name'],
                              ),
                              subtitle: Text(studentData['Email']),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
           floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Addlist())).then((result) {
              if(result != null) {
                String name = result['name'];
                 int age = result['age'];
              String email = result['email'];
              String contact = result['contact'];
              Provider.of<HomeController>(context, listen: false).addTodo(name, age.toString(), email, contact);
              }
            }),
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 7, 255, 48),
        ),
      ),
    );
  }
}