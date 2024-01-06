import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/condroller/db_condroller.dart';
import 'package:user_management_app/models/addtextfiledmodel.dart';
import 'package:user_management_app/models/todo.dart';

class update extends StatefulWidget {
  update({
    Key? key,
  }) : super(key: key);

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _key = GlobalKey<FormState>();

  User? currentUser = FirebaseAuth.instance.currentUser;
  @override
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = args['Name'];
    ageController.text = args['Age'];
    emailController.text = args['Email'];
    phoneController.text = args['contact'];
    final studentId = args['id'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 187, 194, 189),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 199, 211, 202), Colors.white],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  children: [
                    const Text(
                      'Add Student',
                      style: TextStyle(fontSize: 35),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Color.fromARGB(255, 170, 179, 172)
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 15.0),
                                      TextFieldDemo(controller: nameController, name: 'name'),

                          
                            const SizedBox(height: 15.0),
                                    TextFieldDemo(controller: ageController, name: 'age'),

                            const SizedBox(height: 15.0),
                            TextFieldDemo(
                              controller: emailController,
                              name: 'email',
                            ),
                            const SizedBox(height: 15.0),
                                     TextFieldDemo(controller: phoneController, name: 'contact'),
                                           
                            const SizedBox(height: 15.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    Provider.of<HomeController>(context,listen: false)
                                        .updateTodo(
                                            studentId,
                                            nameController as Todo,
                                            emailController,
                                            ageController,
                                            phoneController
                                            );
                                  }
                                  Navigator.pop(context);
                                },
                                child: const Text('Update'),
                              ),
                            ),
                            const SizedBox(height: 45.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}