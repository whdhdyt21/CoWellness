import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:CoWellness/component/bottom_bar.dart';
import 'package:CoWellness/pages/login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // is user loggin
          if (snapshot.hasData) {
            return const BottomBar();
          } else {
            return const LoginOrRegisterPage();
          }
          // is user not loggin
        },
      ),
    );
  }
}
