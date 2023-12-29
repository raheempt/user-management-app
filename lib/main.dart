
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/condroller/db_condroller.dart';
import 'package:user_management_app/views/Auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context)=>StudentData())
  ],
  child:  const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'user management app',
  home: AuthPage (),
    );
  }
}

