import 'package:flutter/material.dart';
import 'package:newapp/login_si/service.dart';
import 'package:newapp/login_si/signUp.dart';
import 'package:newapp/widgets/loginBox.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 60, 64),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.center,
            child: LoginBox(boxName: "Login"),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an Account?",
                style: TextStyle(
                  color: Color.fromARGB(135, 255, 255, 255),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const signUp()),
                  );
                },
                child: const Text(
                  "SignUp",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              User? user = await AuthServices().signInWithGoogle();
              if (user != null) {
                // Successful sign-in
              } else {
                // Handle sign-in failure
              }
            },
            child: const Text("Sign in with Google"),
          ),
        ],
      ),
    );
  }
}
