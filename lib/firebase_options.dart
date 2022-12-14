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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDtCdCxDcERHRlGSTGzNjOZR-wY3Kgh0nE',
    appId: '1:951244767304:web:ffc3bf0f3e787cce52187d',
    messagingSenderId: '951244767304',
    projectId: 'chat-f2aff',
    authDomain: 'chat-f2aff.firebaseapp.com',
    storageBucket: 'chat-f2aff.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpwoB-FPPGBkvBB5AwHlvcJpZvbcTdx0o',
    appId: '1:951244767304:android:a75796cbf1d56d7c52187d',
    messagingSenderId: '951244767304',
    projectId: 'chat-f2aff',
    storageBucket: 'chat-f2aff.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBm5LFdd_LpgjbhC8JohgsS_Kb3qnZISiU',
    appId: '1:951244767304:ios:3b55f367788cf1aa52187d',
    messagingSenderId: '951244767304',
    projectId: 'chat-f2aff',
    storageBucket: 'chat-f2aff.appspot.com',
    iosClientId: '951244767304-4102f429fhkcuqc59h9no37tm7uu3qi1.apps.googleusercontent.com',
    iosBundleId: 'com.example.wt10',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBm5LFdd_LpgjbhC8JohgsS_Kb3qnZISiU',
    appId: '1:951244767304:ios:3b55f367788cf1aa52187d',
    messagingSenderId: '951244767304',
    projectId: 'chat-f2aff',
    storageBucket: 'chat-f2aff.appspot.com',
    iosClientId: '951244767304-4102f429fhkcuqc59h9no37tm7uu3qi1.apps.googleusercontent.com',
    iosBundleId: 'com.example.wt10',
  );
}
