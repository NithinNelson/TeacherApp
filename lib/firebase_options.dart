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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqUNnu3OaaOXVFc7iJEZoNBUU9TPvxjdM',
    appId: '1:560185133261:android:0d5cb3cc68629940f84184',
    messagingSenderId: '560185133261',
    projectId: 'bm-teacherapp',
    storageBucket: 'bm-teacherapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBo1NCo-MnXdTuixH9MWeERO8Bco_6u7LA',
    appId: '1:560185133261:ios:3238bc0dc25506aef84184',
    messagingSenderId: '560185133261',
    projectId: 'bm-teacherapp',
    storageBucket: 'bm-teacherapp.appspot.com',
    androidClientId:
        '560185133261-10cabiv4liohbs49mkg3s08g42tpuamf.apps.googleusercontent.com',
    iosClientId:
        '560185133261-8tb3lf9s1c7dkugv2ishnjunhli5ranr.apps.googleusercontent.com',
    iosBundleId: 'com.educore.bmteacher',
  );
}
