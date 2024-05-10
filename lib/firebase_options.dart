// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBE1VwuoReay9ZYOAUeoSoN_0Q41qtLVsM',
    appId: '1:619842515579:web:32314abe783f1e4f14e8de',
    messagingSenderId: '619842515579',
    projectId: 'track-feb3d',
    authDomain: 'track-feb3d.firebaseapp.com',
    storageBucket: 'track-feb3d.appspot.com',
    measurementId: 'G-CX7V6CFH2E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9AwexS3DFRPxMywNwDon-A_uI9JduHVo',
    appId: '1:619842515579:android:47795d1c7748beff14e8de',
    messagingSenderId: '619842515579',
    projectId: 'track-feb3d',
    storageBucket: 'track-feb3d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5M8lkd4HvckakS9fY392k2sOY14k3GAs',
    appId: '1:619842515579:ios:942f817f11a886d214e8de',
    messagingSenderId: '619842515579',
    projectId: 'track-feb3d',
    storageBucket: 'track-feb3d.appspot.com',
    iosBundleId: 'com.example.weightTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5M8lkd4HvckakS9fY392k2sOY14k3GAs',
    appId: '1:619842515579:ios:942f817f11a886d214e8de',
    messagingSenderId: '619842515579',
    projectId: 'track-feb3d',
    storageBucket: 'track-feb3d.appspot.com',
    iosBundleId: 'com.example.weightTracker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBE1VwuoReay9ZYOAUeoSoN_0Q41qtLVsM',
    appId: '1:619842515579:web:5b8ea15b72342fb014e8de',
    messagingSenderId: '619842515579',
    projectId: 'track-feb3d',
    authDomain: 'track-feb3d.firebaseapp.com',
    storageBucket: 'track-feb3d.appspot.com',
    measurementId: 'G-ZNT6SCJCGX',
  );

}