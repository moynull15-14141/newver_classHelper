import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: Colors.white, width: 1.0),
      ),
      fillColor: Colors.grey[800],
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 26),
      unselectedIconTheme: IconThemeData(size: 20),
      elevation: 0,
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.black,
  );

  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: Colors.black, width: 1.0),
      ),
      fillColor: Colors.grey[200],
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
      bodyLarge: TextStyle(color: Color.fromARGB(255, 1, 60, 64)),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 223, 241, 149),
  );
}
