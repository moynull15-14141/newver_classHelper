import 'package:flutter/material.dart';
import 'package:newapp/login_si/login.dart';
import 'package:newapp/login_si/service.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 1, 60, 64),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                height: 260,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 3, 84, 89),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 3, 84, 89),
              ),
            ),
            const SizedBox(
              height: 113,
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 3, 84, 89),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: WidgetStateProperty.all<Size>(
                          const Size(250.0, 30.0)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              5), // Set your desired radius value here (e.g., 10.0, 20.0)
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(255, 7, 123, 130)),
                    ),
                    onPressed: () async {
                      await AuthServices().signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: Text("Log out",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Font1',
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
