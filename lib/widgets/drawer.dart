import 'package:flutter/material.dart';
import 'package:newapp/login_si/login.dart';
import 'package:newapp/login_si/service.dart';
import 'package:newapp/widgets/button.dart';

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
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 3, 84, 89),
                ),
                child: Column(
                  children: [
                    Container(
                        height: 60,
                        width: 290,
                        color: Color.fromARGB(255, 21, 139, 146),
                        child: Column(
                          children: [
                            Button1(
                              btname: 'Button',
                              iconData: Icons.add,
                              onPressed: () {
                                print("button1");
                              },
                            ),
                          ],
                        )),
                  ],
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
                  Button1(
                      onPressed: () async {
                        await AuthServices().signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      btname: "             Log out")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
