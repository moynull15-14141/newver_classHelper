import 'package:flutter/material.dart';
import 'package:newapp/Splash/Splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0), // Set border color and width
            ),
            fillColor: Colors.grey[200], // Set fill color (optional)
          ),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 1, 60, 64),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(size: 26),
            unselectedIconTheme: IconThemeData(size: 20),
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 1, 60, 64),
            unselectedItemColor: Color.fromARGB(141, 241, 255, 186),
            selectedItemColor: Color.fromARGB(255, 241, 255, 186),
          ),
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Color.fromARGB(255, 1, 60, 64))),
          scaffoldBackgroundColor: const Color.fromARGB(255, 223, 241, 149)),
      home: const splash(),
    );
  }
}
