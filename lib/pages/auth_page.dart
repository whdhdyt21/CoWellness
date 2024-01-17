import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_api/component/bottom_bar.dart';
import 'package:login_api/pages/forum_discusion.dart';
import 'package:login_api/pages/login_or_register.dart';
import 'package:login_api/pages/login_pages.dart';

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
            return BottomBar();
          } else {
            return LoginOrRegisterPage();
          }
          // is user not loggin
        },
      ),
    );
  }
}
