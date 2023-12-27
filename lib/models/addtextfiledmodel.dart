import 'package:flutter/material.dart';

class TextFieldDemo extends StatelessWidget {
  final TextEditingController controller;
  final String name;

  const TextFieldDemo({
    Key? key,
    required this.controller,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: name,
        hintText: name,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
