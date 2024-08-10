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
      print("Firebase option is for web");
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBgpk86sFgGZ4fg86o6xUtZRChnOMYH19Q',
    appId: '1:322788367834:web:28bb759c04e43a4afa34e3',
    messagingSenderId: '322788367834',
    projectId: 'portfolio-c2b5f',
    authDomain: 'portfolio-c2b5f.firebaseapp.com',
    storageBucket: 'portfolio-c2b5f.appspot.com',
    measurementId: 'G-KZZ3HQQ2YD',
    databaseURL: "https://portfolio-c2b5f-default-rtdb.firebaseio.com/"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoteFIKLgR-XjLx210ncFPAtmpsFSshZU',
    appId: '1:322788367834:android:b9616dfe76ac2379fa34e3',
    messagingSenderId: '322788367834',
    projectId: 'portfolio-c2b5f',
    storageBucket: 'portfolio-c2b5f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJT-XAn0X7-9Jw-2w1ZZJQFP9kS1pf4Jc',
    appId: '1:322788367834:ios:d31b55b44f4ce0c2fa34e3',
    messagingSenderId: '322788367834',
    projectId: 'portfolio-c2b5f',
    storageBucket: 'portfolio-c2b5f.appspot.com',
    iosBundleId: 'com.pyitheimkyaw.portfolio',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBgpk86sFgGZ4fg86o6xUtZRChnOMYH19Q',
    appId: '1:322788367834:web:6ec71d3278c8f3e4fa34e3',
    messagingSenderId: '322788367834',
    projectId: 'portfolio-c2b5f',
    authDomain: 'portfolio-c2b5f.firebaseapp.com',
    storageBucket: 'portfolio-c2b5f.appspot.com',
    measurementId: 'G-0NLPBPQZXJ',
  );
}