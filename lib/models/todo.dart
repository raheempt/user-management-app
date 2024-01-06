import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String id;
  final String name;
  final String age;
  final String email;
  final String contact;

  Todo({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.contact,
  });

  Todo copywith({String? name, String? age, String? email, String? contact}) => Todo( 
    id: id,
     name: name ?? this.name, age: age ?? this.age, email: email ?? this.email, contact: contact ?? this.contact);

  factory  Todo.fromMap(
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot 
  ) => Todo(id: documentSnapshot.id, name: documentSnapshot.id, age: documentSnapshot.data()!['text'], email: documentSnapshot.data()!['email'], contact: documentSnapshot.data()!['contact']);

  Map<String, dynamic> toMap() => {
    'name' : name,
    'age' : age,
    'email' : email,
    'contact' : contact,
  };
  @override
  String toString() {
    return '$name, $age, $email, $contact';
  }
}