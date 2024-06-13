// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBaCV94CW_hxlPFLuNI7KuKNpfx5oMApjI',
    appId: '1:333967358143:web:ee3e443b90c6cc9433ae0a',
    messagingSenderId: '333967358143',
    projectId: 'new-flutter-app-40421',
    authDomain: 'new-flutter-app-40421.firebaseapp.com',
    storageBucket: 'new-flutter-app-40421.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUatd-xXFHB13vVf0XmUoBijwhPhvfw9Q',
    appId: '1:333967358143:android:d6508887042515fa33ae0a',
    messagingSenderId: '333967358143',
    projectId: 'new-flutter-app-40421',
    storageBucket: 'new-flutter-app-40421.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaq63zvoQZINRjys2KA65AQYPEg1fGJtw',
    appId: '1:333967358143:ios:2baa41e45e2c473e33ae0a',
    messagingSenderId: '333967358143',
    projectId: 'new-flutter-app-40421',
    storageBucket: 'new-flutter-app-40421.appspot.com',
    iosBundleId: 'com.example.newapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAaq63zvoQZINRjys2KA65AQYPEg1fGJtw',
    appId: '1:333967358143:ios:2baa41e45e2c473e33ae0a',
    messagingSenderId: '333967358143',
    projectId: 'new-flutter-app-40421',
    storageBucket: 'new-flutter-app-40421.appspot.com',
    iosBundleId: 'com.example.newapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBaCV94CW_hxlPFLuNI7KuKNpfx5oMApjI',
    appId: '1:333967358143:web:8cbbc15e11c2b58333ae0a',
    messagingSenderId: '333967358143',
    projectId: 'new-flutter-app-40421',
    authDomain: 'new-flutter-app-40421.firebaseapp.com',
    storageBucket: 'new-flutter-app-40421.appspot.com',
  );
}