import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/condroller/db_condroller.dart';
import 'package:user_management_app/models/addtextfiledmodel.dart';
import 'package:user_management_app/views/widget.dart/widget.dart';

class Addlist extends StatefulWidget {
  const Addlist({super.key});

  @override
  State<Addlist> createState() => _AddlistState();
}

class _AddlistState extends State<Addlist> {
    User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

        final nameController = TextEditingController();
    final ageController = TextEditingController();
    final contactController = TextEditingController();
    final emailController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldDemo(controller: nameController, name: 'name'),
sizedbox,          
          
          TextFieldDemo(controller: ageController, name: 'age'),
sizedbox,          
            
          TextFieldDemo(controller: contactController, name:'phone no'),
sizedbox,          
          TextFieldDemo(controller: emailController, name: 'email'),
sizedbox ,
    ElevatedButton(
                  onPressed: () async {
                    final name = nameController.text;
                    final age = ageController.text;
                    final contact = contactController.text;
                    final email = emailController.text;
                      // User? currentUser = FirebaseAuth.instance.currentUser;

                            Provider.of<HomeController>(context,listen: false).addTodo(name, age, email, contact,);

                                    nameController.clear();
                                    ageController.clear();
                                    emailController.clear();
                                    contactController.clear();

                    Navigator.pop(context);
                    Provider.of<HomeController>(context ,listen: false).addTodo(name, age, email, contact);

                  },
                  child: Text('Save'),
                ),         
        ],
        ),
      ),
    );
  }
} 