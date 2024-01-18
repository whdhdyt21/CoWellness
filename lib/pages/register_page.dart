import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_api/component/my_button.dart';
import 'package:login_api/component/my_textfield.dart';
import 'package:login_api/component/password_field.dart';
import 'package:login_api/component/square_title.dart';
import 'package:login_api/services/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  bool passwordObsecured = true;
  bool passwordObsecured2 = true;
  // sign user in
  void signUserUp() async {
    // loading sircle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        showErrorMessage("Password doesn't match");
      }
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);
      Navigator.pop(context);
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
                  height: 15,
                ),
                //logo
                SvgPicture.asset(
                  'assets/img_logo.svg',
                  height: 100,
                ),
                const SizedBox(
                  height: 25,
                ),

                //welcome back, you've been missed
                const Text('SELAMAT DATANG',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),

                const SizedBox(height: 40),
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

                //confirm password textfield
                PasswordField(
                  controller: confirmPasswordController,
                  hintext: 'Confirm Password',
                  obsecureText: passwordObsecured2,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordObsecured2 = !passwordObsecured2;
                      });
                    },
                    icon: Icon(passwordObsecured2
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),

                const SizedBox(height: 10),

                const SizedBox(height: 20),
                //sign in button
                MyButton(
                  text: 'Sign Up',
                  onTap: signUserUp,
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
                    Text('Already have an account? ',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        )),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Login Now',
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
