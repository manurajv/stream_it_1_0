import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  late final String proPicUrl;

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
  Future<void> saveUserDataToFirestore(User user, String imageUrl) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'name': user.displayName,
      'email': user.email,
      'profilePicture': user.photoURL,
      'profileImageUrl': imageUrl,
      // ... other fields as needed
    });
  }

  Future<void> createMembers(User user) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      var membersDocRef = firestore.collection('members').doc(user.uid);

      // Use set with merge option to update the document without overwriting existing data
      await membersDocRef.set({
        'uid': user.uid,
        // ... other fields as needed
      }, SetOptions(merge: true));
    } catch (e) {
      print("Error creating/updating members: $e");
      // Handle error
    }
  }


  Future<String> uploadImageToFirestore(String imageUrl) async {
    try {
      // Download the image from the URL
      var response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        // Create a temporary file to store the downloaded image
        var tempDir = await getTemporaryDirectory();
        var tempPath = path.join(tempDir.path, 'temp_image.jpg');
        var file = File(tempPath);
        await file.writeAsBytes(response.bodyBytes);

        var storageRef = FirebaseStorage.instance.ref().child('profile_images').child('${DateTime.now().millisecondsSinceEpoch}.jpg');
        await storageRef.putFile(file);

        // Get the download URL of the uploaded image
        var downloadUrl = await storageRef.getDownloadURL();

        // Return the download URL
        return downloadUrl;
      } else {
        print('Failed to download image: ${response.statusCode}');
        return '';
      }
    } catch (e) {
      print('Error uploading image to Firestore: $e');
      return '';
    }
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
