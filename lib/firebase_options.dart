import 'package:firebase_core/firebase_core.dart'
    show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
          'Web no està configurat manualment en aquest projecte.');
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
            'Platform ${defaultTargetPlatform.name} no suportada per DefaultFirebaseOptions.');
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLDbZO5bcSwV_Tc59KxHkk7zyYQnSsa1I',
    appId: '1:692748288462:android:234af4e403e923ba44eb9f',
    messagingSenderId: '692748288462',
    projectId: 'foku-715fa',
    storageBucket: 'foku-715fa.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCS9xT0WVRK2ElcBaJeopPF4nBROuTrOXw',
    appId: '1:692748288462:ios:38b97aa1947a9bce44eb9f',
    messagingSenderId: '692748288462',
    projectId: 'foku-715fa',
    storageBucket: 'foku-715fa.firebasestorage.app',
    iosBundleId: 'com.example.foku',
  );

}