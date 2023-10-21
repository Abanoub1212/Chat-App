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
    apiKey: 'AIzaSyBkn109Uoc7a317PHoW1tPOmNHD9wbifbs',
    appId: '1:293871650531:web:3212d6769ecb2df052a7d6',
    messagingSenderId: '293871650531',
    projectId: 'chat-app-96412',
    authDomain: 'chat-app-96412.firebaseapp.com',
    storageBucket: 'chat-app-96412.appspot.com',
    measurementId: 'G-ZE62SJLMTC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVIm5aHWcc7u3zIoN-ci_R8XZp99Ljwmk',
    appId: '1:293871650531:android:353460ba18efaee552a7d6',
    messagingSenderId: '293871650531',
    projectId: 'chat-app-96412',
    storageBucket: 'chat-app-96412.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiOkGYL6GVuX5HpXPUssDC-d964CgKfRM',
    appId: '1:293871650531:ios:43828dadbc55c62252a7d6',
    messagingSenderId: '293871650531',
    projectId: 'chat-app-96412',
    storageBucket: 'chat-app-96412.appspot.com',
    iosClientId: '293871650531-7j3mc0focppl2rn464ffnfc4ng0accl4.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCiOkGYL6GVuX5HpXPUssDC-d964CgKfRM',
    appId: '1:293871650531:ios:be15dfe75e91e4b152a7d6',
    messagingSenderId: '293871650531',
    projectId: 'chat-app-96412',
    storageBucket: 'chat-app-96412.appspot.com',
    iosClientId: '293871650531-8ta2uqb0fmi690kuo6eoqpnda0remm0m.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
