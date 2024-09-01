// File: lib/firebase_options.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web; // Add web options
    }
    throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyDwytcSXUM0sHgvq31e-J5NqhlHKgKrNj0",
      authDomain: "myfirstapp-72607.firebaseapp.com",
      projectId: "myfirstapp-72607",
      storageBucket: "myfirstapp-72607.appspot.com",
      messagingSenderId: "94692465538",
      appId: "1:94692465538:web:c51db6558056521f0acd9b",
      measurementId: "G-SLB2SCGBXR"
  );

// Add other platform configurations (e.g., Android, iOS) if needed
}
