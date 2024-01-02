import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBxNrl-pEnUhD19SpXjQ4Qg1JBQ-N6X2mo",
            authDomain: "sme-locator.firebaseapp.com",
            projectId: "sme-locator",
            storageBucket: "sme-locator.appspot.com",
            messagingSenderId: "431438315386",
            appId: "1:431438315386:web:293c5b655f1ef98308a0c3",
            measurementId: "G-N2EKK462NZ"));
  } else {
    await Firebase.initializeApp();
  }
}
