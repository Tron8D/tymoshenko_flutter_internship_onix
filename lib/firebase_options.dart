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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBD5kWcxoxfJ_lISAR44Bss9XI88VVRX-I',
    appId: '1:908368967572:web:6bcba6cf89e967b1178181',
    messagingSenderId: '908368967572',
    projectId: 'my-cards-app',
    authDomain: 'my-cards-app.firebaseapp.com',
    storageBucket: 'my-cards-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLRrGUBjQ9sXXpZpCIGiiiNjQHM8togAw',
    appId: '1:908368967572:android:0cda1a377d28bee7178181',
    messagingSenderId: '908368967572',
    projectId: 'my-cards-app',
    storageBucket: 'my-cards-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-pQ1qzISRTIPsndOZFDHxwdbbBsJZSsM',
    appId: '1:908368967572:ios:29ac85a010151c3d178181',
    messagingSenderId: '908368967572',
    projectId: 'my-cards-app',
    storageBucket: 'my-cards-app.appspot.com',
    iosClientId:
        '908368967572-n948a6qkgivo4abjtarn5f8qf2tac6el.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterIntershipOnix',
  );
}
