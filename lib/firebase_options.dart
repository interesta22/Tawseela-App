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
    apiKey: 'AIzaSyBCysXrh4irGYZGa7d0r58f16stcKv3gKg',
    appId: '1:220376217037:web:7aef48467ee3abd173c084',
    messagingSenderId: '220376217037',
    projectId: 'tawseela-app-e5922',
    authDomain: 'tawseela-app-e5922.firebaseapp.com',
    storageBucket: 'tawseela-app-e5922.firebasestorage.app',
    measurementId: 'G-KLW00SLMC3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDL_E71e_CynJxfcIj5UvOacdP8pV2onJ4',
    appId: '1:220376217037:android:372642d29ba9263973c084',
    messagingSenderId: '220376217037',
    projectId: 'tawseela-app-e5922',
    storageBucket: 'tawseela-app-e5922.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVpZmc4xG71RPnsVP1RCldGYLBwJNwtDo',
    appId: '1:220376217037:ios:4196520b2fce087873c084',
    messagingSenderId: '220376217037',
    projectId: 'tawseela-app-e5922',
    storageBucket: 'tawseela-app-e5922.firebasestorage.app',
    iosBundleId: 'com.example.tewseelaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVpZmc4xG71RPnsVP1RCldGYLBwJNwtDo',
    appId: '1:220376217037:ios:4196520b2fce087873c084',
    messagingSenderId: '220376217037',
    projectId: 'tawseela-app-e5922',
    storageBucket: 'tawseela-app-e5922.firebasestorage.app',
    iosBundleId: 'com.example.tewseelaApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBCysXrh4irGYZGa7d0r58f16stcKv3gKg',
    appId: '1:220376217037:web:743b815ab71aab3973c084',
    messagingSenderId: '220376217037',
    projectId: 'tawseela-app-e5922',
    authDomain: 'tawseela-app-e5922.firebaseapp.com',
    storageBucket: 'tawseela-app-e5922.firebasestorage.app',
    measurementId: 'G-Z8M4DQBKQB',
  );
}