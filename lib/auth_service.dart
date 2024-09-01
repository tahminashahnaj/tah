import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up with email and password
  Future<String?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      // If the sign-up is successful, store additional user data in Firestore
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'email': email,
          'createdAt': DateTime.now(),
        });
      }

      return user?.uid; // Return the user's unique ID
    } on FirebaseAuthException catch (e) {
      // Handle Firebase Auth errors
      return _handleAuthError(e);
    } catch (e) {
      // Handle other errors
      print('Error during sign-up: $e');
      return null;
    }
  }

  // Handle FirebaseAuth errors
  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-email':
        return 'The email address is not valid.';
      default:
        return 'An error occurred: ${e.message}';
    }
  }
}
