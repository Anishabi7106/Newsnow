import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBpniZKi38LU8z6tbdnxNTXRSm51NHGWuU",
            authDomain: "newsnow-72d5a.firebaseapp.com",
            projectId: "newsnow-72d5a",
            storageBucket: "newsnow-72d5a.firebasestorage.app",
            messagingSenderId: "922264508146",
            appId: "1:922264508146:web:6c1a9e87fcb7f8b2c8226b",
            measurementId: "G-9H7HLJBKF1"));
  } else {
    await Firebase.initializeApp();
  }
}
