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
    apiKey: 'AIzaSyBOYSWDZH6Qm1HYhlKjHGoKrqY_I3btRkE',
    appId: '1:700024442725:web:05f3fe653bdccf78599b8c',
    messagingSenderId: '700024442725',
    projectId: 'signin-110bf',
    authDomain: 'signin-110bf.firebaseapp.com',
    storageBucket: 'signin-110bf.appspot.com',
    measurementId: 'G-ZN2LRL0PZY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_ZexjLdQJuHctSJ2A3Eo70dESB-tIz0M',
    appId: '1:700024442725:android:23c90120f8cd4924599b8c',
    messagingSenderId: '700024442725',
    projectId: 'signin-110bf',
    storageBucket: 'signin-110bf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqaBqjraiGweiT-1f3iYsFUg3ezV9lYA0',
    appId: '1:700024442725:ios:d82889d504dcd8db599b8c',
    messagingSenderId: '700024442725',
    projectId: 'signin-110bf',
    storageBucket: 'signin-110bf.appspot.com',
    iosClientId: '700024442725-mlfjaj14dmcl0gfq4g11e6hlvcupnaqm.apps.googleusercontent.com',
    iosBundleId: 'com.example.signin1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqaBqjraiGweiT-1f3iYsFUg3ezV9lYA0',
    appId: '1:700024442725:ios:d82889d504dcd8db599b8c',
    messagingSenderId: '700024442725',
    projectId: 'signin-110bf',
    storageBucket: 'signin-110bf.appspot.com',
    iosClientId: '700024442725-mlfjaj14dmcl0gfq4g11e6hlvcupnaqm.apps.googleusercontent.com',
    iosBundleId: 'com.example.signin1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBOYSWDZH6Qm1HYhlKjHGoKrqY_I3btRkE',
    appId: '1:700024442725:web:9b1eb50b6000ceb9599b8c',
    messagingSenderId: '700024442725',
    projectId: 'signin-110bf',
    authDomain: 'signin-110bf.firebaseapp.com',
    storageBucket: 'signin-110bf.appspot.com',
    measurementId: 'G-2NWM9J15BW',
  );
}
