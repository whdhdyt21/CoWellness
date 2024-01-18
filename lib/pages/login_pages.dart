import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_api/component/my_button.dart';
import 'package:login_api/component/my_textfield.dart';
import 'package:login_api/component/password_field.dart';
import 'package:login_api/component/square_title.dart';
import 'package:login_api/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool passwordObsecured = true;

  // sign user in
  void signUserIn() async {
    // loading sircle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                //logo
                SvgPicture.asset(
                  'assets/img_logo.svg',
                  height: 100,
                ),
                const SizedBox(
                  height: 30,
                ),

                //welcome back, you've been missed
                const Text('SELAMAT DATANG',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),

                const SizedBox(height: 50),
                //username textfield
                MyTextField(
                  controller: emailController,
                  hintext: 'Email',
                  obsecureText: false,
                ),

                const SizedBox(height: 10),
                //password textfield
                PasswordField(
                  controller: passwordController,
                  hintext: 'Password',
                  obsecureText: passwordObsecured,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordObsecured = !passwordObsecured;
                      });
                    },
                    icon: Icon(passwordObsecured
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
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
                  text: 'Sign In',
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
                const SizedBox(height: 20),
                //google
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                        onTap: () => AuthService().signInWithGoole(),
                        imagePath: 'assets/icon_google.png'),
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
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Register Now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
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
