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
    apiKey: 'AIzaSyDxMcZ9OWfprJh5jHtnivWhbnzPDzufnKU',
    appId: '1:384147209607:web:21fb0df73f3b82c1a7e722',
    messagingSenderId: '384147209607',
    projectId: 'lightapp-e11f3',
    authDomain: 'lightapp-e11f3.firebaseapp.com',
    storageBucket: 'lightapp-e11f3.appspot.com',
    measurementId: 'G-TYM434Y2MS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCETcOmu-zJq1Gv2GST75hjP4cSNeHwEZY',
    appId: '1:384147209607:android:7d99a1dc662c47f8a7e722',
    messagingSenderId: '384147209607',
    projectId: 'lightapp-e11f3',
    storageBucket: 'lightapp-e11f3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgpx-Ok7EtifyfSRKRzlY8Bvq7ft-bGa0',
    appId: '1:384147209607:ios:77b81cc74271e6b2a7e722',
    messagingSenderId: '384147209607',
    projectId: 'lightapp-e11f3',
    storageBucket: 'lightapp-e11f3.appspot.com',
    iosClientId: '384147209607-lr2lgr09n9lim2p606ksgvmj9ntvkvaq.apps.googleusercontent.com',
    iosBundleId: 'com.example.peraOn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgpx-Ok7EtifyfSRKRzlY8Bvq7ft-bGa0',
    appId: '1:384147209607:ios:79d5bd9a9cd85c09a7e722',
    messagingSenderId: '384147209607',
    projectId: 'lightapp-e11f3',
    storageBucket: 'lightapp-e11f3.appspot.com',
    iosClientId: '384147209607-n6vlisi707826sc7v3kelee991o7dmbt.apps.googleusercontent.com',
    iosBundleId: 'com.example.peraOn.RunnerTests',
  );
}