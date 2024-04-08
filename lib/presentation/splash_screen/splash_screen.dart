// This file is named splash_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/presentation/login_screen/login_screen.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/custom_image_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, _navigateToLogin()));
  }

  _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(), // Replace with your home screen class
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomImageView(
              placeHolder: ImageConstant.imageNotFound,
              imagePath: ImageConstant.streamit,
              height: getSize(350),
              width: getSize(350),
            ),
            //FlutterLogo(size: 100.0),
            // Padding(
            //   padding: EdgeInsets.only(top: 20.0),
            //   child: Text(
            //     'Your App Name',
            //     style: TextStyle(
            //       fontSize: 24.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
