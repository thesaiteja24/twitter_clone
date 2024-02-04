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
    apiKey: 'AIzaSyBIS6yQhOE3L2lVQQr9iBOOEMLou-MszM4',
    appId: '1:229802773841:web:15fa970b303b105be09770',
    messagingSenderId: '229802773841',
    projectId: 'sai-twitter-clone',
    authDomain: 'sai-twitter-clone.firebaseapp.com',
    storageBucket: 'sai-twitter-clone.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsfxyl7R0DbExq_ltRUOKXAHQDFIf-Iiw',
    appId: '1:229802773841:android:b81fa695e9c2f1a1e09770',
    messagingSenderId: '229802773841',
    projectId: 'sai-twitter-clone',
    storageBucket: 'sai-twitter-clone.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBp6ZrJoTzMfRYVfE_RpgcaMKC2ByIeAlo',
    appId: '1:229802773841:ios:e121d0ac188c2925e09770',
    messagingSenderId: '229802773841',
    projectId: 'sai-twitter-clone',
    storageBucket: 'sai-twitter-clone.appspot.com',
    iosBundleId: 'com.example.twitterClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBp6ZrJoTzMfRYVfE_RpgcaMKC2ByIeAlo',
    appId: '1:229802773841:ios:6d195c5ced22fe10e09770',
    messagingSenderId: '229802773841',
    projectId: 'sai-twitter-clone',
    storageBucket: 'sai-twitter-clone.appspot.com',
    iosBundleId: 'com.example.twitterClone.RunnerTests',
  );
}
