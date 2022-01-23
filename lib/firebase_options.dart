// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC4pBdLI849CiseTU5XXzyO68YJxxxnCMI',
    appId: '1:1024583558196:web:4ecc6b5924e1c5538bd661',
    messagingSenderId: '1024583558196',
    projectId: 'portfolio-5318e',
    authDomain: 'portfolio-5318e.firebaseapp.com',
    storageBucket: 'portfolio-5318e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqhJMkuAJPyZnw0UbMTcfxHwJjegXCeoI',
    appId: '1:1024583558196:android:9367e45189ea43f88bd661',
    messagingSenderId: '1024583558196',
    projectId: 'portfolio-5318e',
    storageBucket: 'portfolio-5318e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBys9kFVgSPuQeL64i-Fxgi7VYA-qJ3iYU',
    appId: '1:1024583558196:ios:8ed4513ea61fcf278bd661',
    messagingSenderId: '1024583558196',
    projectId: 'portfolio-5318e',
    storageBucket: 'portfolio-5318e.appspot.com',
    iosClientId: '1024583558196-4n75u5pa2aem88v35aobtr9pofoevh84.apps.googleusercontent.com',
    iosBundleId: 'com.coldcoder.com',
  );
}
