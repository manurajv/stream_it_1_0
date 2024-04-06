import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  // Facebook Sign-In
  Future<UserCredential> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      final facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);
      return await _firebaseAuth.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      print(e.toString());
      throw Exception('Facebook sign-in failed.');
    }
  }

  // Save User Data to Firestore
  Future<void> saveUserDataToFirestore(User user) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('users').doc(user.uid).set({
      'name': user.displayName,
      'email': user.email,
      'profilePicture': user.photoURL,
      // ... other fields as needed
    });
  }

  // // Sign In with Email and Password
  // Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
  //   try {
  //     return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     throw Exception(e.message); // Customize error messages as needed
  //   }
  // }
  //
  // // Sign Up with Email and Password
  // Future<UserCredential> createUserWithEmailAndPassword(String email, String password) async {
  //   try {
  //     return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     throw Exception(e.message); // Customize error messages as needed
  //   }
  // }

  // Sign Out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  // Stream of auth state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}
