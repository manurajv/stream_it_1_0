import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_it_1_0/main.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:stream_it_1_0/core/constants/constants.dart';
import 'package:stream_it_1_0/routes/app_routes.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stream_it_1_0/core/firebase_auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stream_it_1_0/widgets/custom_text_form_field.dart';
import 'package:stream_it_1_0/core/firebase_auth_service.dart';


import '../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, dynamic>? _userData;
  bool _isLoggedIn = true;
  AccessToken? _accessToken;

  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  void initState() {
    super.initState();
    _checkIfisLoggedIn();
  }

  Future<void> _checkIfisLoggedIn() async {
    try {
      final accessToken = await FacebookAuth.instance.accessToken;
      if (accessToken != null) {
        //_handleLogin();
      } else {
        setState(() {
          _isLoggedIn = false; // Only change state if not already logged in
        });
      }
    } catch (e) {
      // Handle potential errors during Facebook access
      print('Error checking Facebook login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error checking Facebook login state'))
      );
    }
  }

  _handleLogin() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(permissions: ["email","public_profile"]);
      if (result.status == LoginStatus.success) {
        // Handle successful login
        _accessToken = result.accessToken;

        final userData = await FacebookAuth.instance.getUserData();
        _userData = userData;

        final facebookName = _userData?['name'] ?? 'Name not provided';
        final facebookEmail = _userData?['email'] ?? 'Email not provided';
        String profilePictureURL = _userData?['picture']['data']['url'] ?? 'Url not provided';

        await Constants.setAccessToken(_accessToken!.token);
        await Constants.setFacebookName(facebookName);
        await Constants.setEmail(facebookEmail);
        await Constants.setPicture(profilePictureURL);

        String imageUrl = await _authService.uploadImageToFirestore(profilePictureURL);
        await Constants.setProPic(imageUrl);

        UserCredential userCredential = await _authService.signInWithFacebook();
        await _authService.saveUserDataToFirestore(userCredential.user!, imageUrl);
        await Constants.setUId(userCredential.user!.uid);
        
        await _authService.createMembers(userCredential.user!);

        // Update login state
        saveLoginState(true);

        // Navigate to HomeScreen
        Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
      } else {
        // Handle login failure
        print(result.status);
        print(result.message);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Facebook Login Failed'))
        );
        // Update login state
        saveLoginState(false);
      }
    } catch (e) {
      // Handle exceptions
      print('Facebook Login Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Facebook Login Failed'))
      );
      // Update login state
      saveLoginState(false);
    }
  }

  // _handleLogout() async {
  //   await FacebookAuth.instance.logOut();
  //   _accessToken = null;
  //   _userData = null;
  //   setState(() {
  //
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(50),
              ),
              CustomImageView(
                placeHolder: ImageConstant.imageNotFound,
                imagePath: ImageConstant.streamit,
                height: getSize(300),
                width: getSize(300),
              ),
              //Spacer(),
              CustomButton(
                onTap: _handleLogin,
                alignment: Alignment.center,
                height: getVerticalSize(
                  50,
                ),
                width: getHorizontalSize(
                  200,
                ),
                text: "Login With Facebook",
                margin: getMargin(
                  top: 7,
                  bottom: 8,
                ),
              ),
              // Container(
              //   child: Image.network(_userData?['picture']['data']['url']),
              // ),
              // Container(
              //   child: Text(_userData!['name'].toString()),
              // ),
              // Container(
              //   child: Text(_userData!['email'].toString()),
              // ),
            ],

          ),
        ),
      ),
    );
  }
}
