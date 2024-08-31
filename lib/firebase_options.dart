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
    apiKey: 'Your-Web-API-Key',
    authDomain: 'Your-Web-Auth-Domain',
    projectId: 'Your-Project-ID',
    storageBucket: 'Your-Storage-Bucket',
    messagingSenderId: 'Your-Messaging-Sender-ID',
    appId: 'Your-App-ID',
    measurementId: 'Your-Measurement-ID',
  );

// Add other platform configurations (e.g., Android, iOS) if needed
}
