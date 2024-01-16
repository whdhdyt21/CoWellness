import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_api/component/my_button.dart';
import 'package:login_api/component/my_textfield.dart';
import 'package:login_api/component/square_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in
  void signUserIn() async {
    // loading sircle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //try sign in
    // try {
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: emailController.text,
    //     password: passwordController.text,
    //   );
    //   Navigator.pop(context);
    // } on FirebaseAuthException catch (e) {
    //   Navigator.pop(context);
    //   if (e.code == 'user-not-found') {
    //     wrongEmailMessage();
    //   } else if (e.code == 'wrong-password') {
    //     invalidPasswordMessage();
    //   } else if (e.code == 'invalid-email') {
    //     wrongEmailMessage();
    //   } else {
    //     // Handle other errors
    //     print("Error: ${e.message}");
    //   }
    // }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'invalid-email') {
        invalidPasswordMessage();
      } else if (e.code == 'wrong-password') {
        invalidPasswordMessage();
      } else if (e.code == 'user-not-found') {
        invalidEmailMessage();
      }
    }
  }

// invalid email message popup
  void invalidEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Invalid Email2'),
        );
      },
    );
  }

  void invalidPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Invalid Password'),
        );
      },
    );
  }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Invalid Email'),
        );
      },
    );
  }

  // wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Invalid Password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                //logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
                ),

                //welcome back, you've been missed
                const Text('Welcome Back, You\'ve been missed',
                    style: TextStyle(
                      fontSize: 16,
                    )),

                const SizedBox(height: 50),
                //username textfield
                MyTextField(
                  controller: emailController,
                  hintext: 'Email',
                  obsecureText: false,
                ),

                const SizedBox(height: 10),
                //password textfield
                MyTextField(
                  controller: passwordController,
                  hintext: 'Password',
                  obsecureText: true,
                ),

                const SizedBox(height: 10),
                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          )),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                //sign in button
                MyButton(
                  onTap: signUserIn,
                ),

                const SizedBox(height: 50),
                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade400,
                          thickness: 0.8,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'or continue with',
                            style: TextStyle(color: Colors.grey.shade700),
                          )),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade400,
                          thickness: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                //google
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'assets/icon_google.png'),
                  ],
                ),

                const SizedBox(height: 30),
                //not a member? sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member? ',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        )),
                    const SizedBox(width: 4),
                    const Text('Register Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
