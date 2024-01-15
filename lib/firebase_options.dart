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
    apiKey: 'AIzaSyBHrR-9WgMZNxpwvKcn4WxYkuLVHgOr-3c',
    appId: '1:605670987815:web:5fb4155dac2a2ad8de9602',
    messagingSenderId: '605670987815',
    projectId: 'crud-a3970',
    authDomain: 'crud-a3970.firebaseapp.com',
    storageBucket: 'crud-a3970.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiPq814E7eZCkzsM-_2YUDklsAfyPYUqM',
    appId: '1:605670987815:android:b34c4611f30a24cbde9602',
    messagingSenderId: '605670987815',
    projectId: 'crud-a3970',
    storageBucket: 'crud-a3970.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBR53U1dnfoasEKu9vFpRNRrNCAaeGBufw',
    appId: '1:605670987815:ios:f8f8f0c4809362dfde9602',
    messagingSenderId: '605670987815',
    projectId: 'crud-a3970',
    storageBucket: 'crud-a3970.appspot.com',
    iosBundleId: 'com.example.crud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBR53U1dnfoasEKu9vFpRNRrNCAaeGBufw',
    appId: '1:605670987815:ios:3744155e30d107f7de9602',
    messagingSenderId: '605670987815',
    projectId: 'crud-a3970',
    storageBucket: 'crud-a3970.appspot.com',
    iosBundleId: 'com.example.crud.RunnerTests',
  );
}
