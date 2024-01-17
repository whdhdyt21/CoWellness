import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final controller;
  final String hintext;
  final bool obsecureText;
  final Widget? suffix;
  

  const PasswordField(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obsecureText,
      required this.suffix});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
        suffixIcon: suffix,
        ),
      ),
    );
  }
}
