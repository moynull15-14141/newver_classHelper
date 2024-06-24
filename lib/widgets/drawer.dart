import 'package:flutter/material.dart';
import 'package:newapp/them/them_notifire.dart';
import 'package:provider/provider.dart';
import 'package:newapp/login_si/login.dart';
import 'package:newapp/login_si/service.dart';
import 'package:newapp/widgets/button.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 1, 60, 64),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 140),
              child: Container(
                height: 230,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 3, 84, 89),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 21, 139, 146),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          height: 60,
                          width: 260,
                          child: Button1(
                            btname: 'Light Mode',
                            iconData: themeNotifier.isDarkMode
                                ? Icons.wb_sunny
                                : Icons.nightlight_round,
                            onPressed: () {
                              themeNotifier.toggleTheme();
                            },
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 21, 139, 146),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        height: 60,
                        width: 260,
                        child: Button1(
                          btname: 'Notification',
                          iconData: Icons.notifications,
                          onPressed: () {
                            print("button1");
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 21, 139, 146),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        height: 60,
                        width: 260,
                        child: Button1(
                          btname: 'Settings',
                          iconData: Icons.settings,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 160,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 3, 84, 89),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 21, 139, 146),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      height: 60,
                      width: 260,
                      child: Button1(
                        btname: 'Support',
                        iconData: Icons.support,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 21, 139, 146),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      height: 60,
                      width: 260,
                      child: Button1(
                        btname: 'Legal & Policies',
                        iconData: Icons.policy,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 113,
            ),
            InkWell(
              onTap: () async {
                await AuthServices().signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color.fromARGB(255, 21, 139, 146),
                ),
                child: const Center(
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      color: Color.fromARGB(255, 241, 255, 186),
                      fontFamily: 'Font1',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
