import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newapp/them/them_notifire.dart';
import 'package:provider/provider.dart';
import 'package:newapp/myApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}
