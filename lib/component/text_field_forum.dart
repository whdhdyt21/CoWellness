import 'package:flutter/material.dart';

class TextForumField extends StatelessWidget {
  final controller;
  final String hintext;
  final bool obsecureText;

  const TextForumField({
    Key? key,
    required this.controller,
    required this.hintext,
    required this.obsecureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          double.infinity, // Menyesuaikan lebar container dengan lebar parent
      margin: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintext,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
