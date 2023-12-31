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
    apiKey: 'AIzaSyAjVXryV7MpcxYsFeZlrEsnhUfod2rHGHQ',
    appId: '1:1004444702686:web:bc863bc8b2f0ba941eef4f',
    messagingSenderId: '1004444702686',
    projectId: 'loginwithprovider-76c44',
    authDomain: 'loginwithprovider-76c44.firebaseapp.com',
    storageBucket: 'loginwithprovider-76c44.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1UXdourcMXnwGa-9yMxz0wwWH5qSrNiI',
    appId: '1:1004444702686:android:4f8ff90b77e7a3061eef4f',
    messagingSenderId: '1004444702686',
    projectId: 'loginwithprovider-76c44',
    storageBucket: 'loginwithprovider-76c44.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCukzz5vn2_ivxgySQR5_pv-e3tDTc2pmI',
    appId: '1:1004444702686:ios:74d882d88942021e1eef4f',
    messagingSenderId: '1004444702686',
    projectId: 'loginwithprovider-76c44',
    storageBucket: 'loginwithprovider-76c44.appspot.com',
    iosBundleId: 'com.example.userManagementApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCukzz5vn2_ivxgySQR5_pv-e3tDTc2pmI',
    appId: '1:1004444702686:ios:e7c9753b2a6e3df21eef4f',
    messagingSenderId: '1004444702686',
    projectId: 'loginwithprovider-76c44',
    storageBucket: 'loginwithprovider-76c44.appspot.com',
    iosBundleId: 'com.example.userManagementApp.RunnerTests',
  );
}
