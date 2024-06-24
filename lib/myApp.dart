import 'package:flutter/material.dart';
import 'package:newapp/them/them_notifire.dart';
import 'package:provider/provider.dart';
import 'package:newapp/Splash/Splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      theme: themeNotifier.currentTheme,
      home: const splash(),
    );
  }
}
