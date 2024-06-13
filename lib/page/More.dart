import 'package:flutter/material.dart';
import 'package:newapp/login_si/login.dart';
import 'package:newapp/login_si/service.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: ElevatedButton(
              onPressed: () async {
                await AuthServices().signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              child: const Text("LogOut"))),
    );
  }
}
