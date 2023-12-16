import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

 class loginTextField extends StatelessWidget{
  final condroller;
  final String hintText;
  final bool obscureText;
  const loginTextField({
    super.key,
    required this.condroller,
    required this.hintText,
    required this.obscureText,
  });


  @override
  Widget build(BuildContext context){
    return    Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller:condroller,
                  obscureText: obscureText,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                hintText: hintText,
                                hintStyle: TextStyle(color: Colors.grey[500])
                                )
                                ),
              );
  }
}