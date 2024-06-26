import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/widgets/app_bar/appbar_image.dart';
import 'package:stream_it_1_0/widgets/app_bar/appbar_title.dart';
import 'package:stream_it_1_0/widgets/app_bar/custom_app_bar.dart';
import 'package:stream_it_1_0/widgets/custom_icon_button.dart';
import 'package:stream_it_1_0/core/constants/constants.dart';
import 'package:stream_it_1_0/core/firebase_auth_service.dart';

import '../../core/firebase_messaging_handler.dart';
import '../../core/notification_service.dart';
import '../../main.dart';

class UserAccountScreen extends StatefulWidget { // Changed to StatefulWidget
  @override
  _UserAccountScreenState createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  String _facebookName = "Loading...";
  String _email = "Loading...";
  String _picture = "Loading...";
  final FirebaseAuthService _authService = FirebaseAuthService();
  String? mtoken = "";
  String? _uid = Constants.getUId();
  bool _isDarkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadFacebookData(); // Load name on screen initialization
    requestPermission();
    getToken();
    _loadDarkModeStatus();
  }

  Future<void> _loadDarkModeStatus() async {
    bool isDarkMode = await Constants.isDarkModeEnabled();
    setState(() {
      _isDarkModeEnabled = isDarkMode;
    });
  }

  void _loadFacebookData() async {
    final name = await Constants.getFacebookName();
    final email = await Constants.getEmail();
    final picture = await Constants.getPicture();
    setState(() {
      _facebookName = name ?? "Name not found";
      _email = email ?? "Email not found";
      _picture = picture ?? "Picture not found";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            //backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(42),
                leadingWidth: 40,
                // leading: AppbarImage(
                //     height: getSize(24),
                //     width: getSize(24),
                //     svgPath: ImageConstant.imgArrowleft,
                //     margin: getMargin(left: 16, bottom: 5),
                //     onTap: () {
                //       onTapArrowleft5(context);
                //     }),
                centerTitle: true,
                title: AppbarTitle(text: "Welcome! $_facebookName"),
                actions: [
                  // AppbarImage(
                  //     height: getSize(24),
                  //     width: getSize(24),
                  //     svgPath: ImageConstant.imgOverflowmenu,
                  //     margin: getMargin(left: 16, right: 16, bottom: 5))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 31, right: 16, bottom: 31),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getSize(150),
                          width: getSize(150),
                          child:
                              Stack(alignment: Alignment.topRight, children: [
                            CustomImageView(
                                url: _picture,
                                height: getSize(150),
                                width: getSize(150),
                                radius: BorderRadius.circular(
                                    getHorizontalSize(75)),
                                alignment: Alignment.center),
                            // CustomIconButton(
                            //     height: 30,
                            //     width: 30,
                            //     margin: getMargin(top: 5, right: 2),
                            //     alignment: Alignment.topRight,
                            //     child: CustomImageView(
                            //         svgPath: ImageConstant.imgForward))
                          ])),
                      Padding(
                          padding: getPadding(top: 19),
                          child: Text(_facebookName,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.headlineMedium)),
                      Padding(
                          padding: getPadding(top: 7),
                          child: Text(_email,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroyMedium16Bluegray400)),
            GestureDetector(
              onTap: (){
                //NotificationService.onMessage("hello");
                String token = 'fA-5b7sjTTGgA9ubQptoOh:APA91bE40RY_S1DOWQstE_4b1IEAaNyqitHRH3_FOcgT-oAlH2DqkUiH-241lqpRGogqujN-UPiiMTgQCaCJ7rgDL-z1wLmSoGbK0-qZUX4-_RfGPlmNG3RlAofw6gJBN6AN8MQhAAwk';

              },
                      child: Padding(
                          padding: getPadding(top: 29),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgNotification,
                                    height: getSize(24),
                                    width: getSize(24),
                                color: _isDarkModeEnabled ? ColorConstant.blueA700 : Colors.black,
                                ),
                                Padding(
                                    padding: getPadding(left: 8, top: 1),
                                    child: Text("Notifications",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.bodyLarge)),
                                Spacer(),
                                CustomImageView(
                                    svgPath: ImageConstant.imgArrowrightBlueGray600,
                                    height: getSize(24),
                                    width: getSize(24),
                                ),
                              ])),
            ),
            GestureDetector(
                      child: Padding(
                          padding: getPadding(top: 29),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgSettings,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(bottom: 1),
                                  color: _isDarkModeEnabled ? ColorConstant.blueA700 : Colors.black,
                                ),
                                Padding(
                                    padding: getPadding(left: 8, top: 3),
                                    child: Text("Language",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.bodyLarge)),
                                Spacer(),
                                CustomImageView(
                                    svgPath:
                                        ImageConstant.imgArrowrightBlueGray600,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(bottom: 1))
                              ])),
            ),
                        Padding(
                          padding: getPadding(top: 27),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgMoonoutline,
                                    height: getSize(24),
                                    width: getSize(24),
                                  color: _isDarkModeEnabled ? ColorConstant.blueA700 : Colors.black,
                                ),
                                Padding(
                                    padding: getPadding(left: 8, top: 1),
                                    child: Text("Dark mode",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.bodyLarge)),
                                Spacer(),
                                Switch(
                                  value: _isDarkModeEnabled,
                                  onChanged: (value) {
                                    setState(() {
                                      _isDarkModeEnabled = value;
                                      Constants.setDarkModeEnabled(value);
                                      // Set light theme when the switch is off
                                      if (!value) {
                                        AdaptiveTheme.of(context).setLight();
                                      }
                                      // Set dark theme when the switch is on
                                      else {
                                        AdaptiveTheme.of(context).setDark();
                                      }
                                    });
                                  },
                                ),

                              ]
                          )
                      ),
            GestureDetector(
                      child: Padding(
                          padding: getPadding(top: 29),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgSettings24x24,
                                    height: getSize(24),
                                    width: getSize(24),
                                  color: _isDarkModeEnabled ? ColorConstant.blueA700 : Colors.black,
                                ),
                                Padding(
                                    padding: getPadding(left: 8, top: 2),
                                    child: Text("General settings",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.bodyLarge)),
                                Spacer(),
                                CustomImageView(
                                    svgPath:
                                        ImageConstant.imgArrowrightBlueGray600,
                                    height: getSize(24),
                                    width: getSize(24))
                              ])),
                                  ),
                                  GestureDetector(
                                  child: Padding(
                                      padding: getPadding(top: 28),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CustomImageView(
                                                svgPath: ImageConstant.imgDashboard,
                                                height: getSize(24),
                                                width: getSize(24),
                                              color: _isDarkModeEnabled ? ColorConstant.blueA700 : Colors.black,
                                            ),
                                            Padding(
                                                padding: getPadding(left: 8, top: 1),
                                                child: Text("Theme",
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: Theme.of(context).textTheme.bodyLarge)),
                                            Spacer(),
                                            CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgArrowrightBlueGray600,
                                                height: getSize(24),
                                                width: getSize(24))
                                          ]
                                      )
                                  ),
                              ),
                              GestureDetector(
                                onTap: (){
                                },
                                child: Padding(
                                    padding: getPadding(top: 29, bottom: 5),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgQuestion,
                                              height: getSize(24),
                                              width: getSize(24),
                                            color: _isDarkModeEnabled ? ColorConstant.blueA700 : Colors.black,
                                          ),
                                          Padding(
                                              padding: getPadding(left: 8, top: 2),
                                              child: Text("Help and feedback",
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: Theme.of(context).textTheme.bodyLarge)),
                                          Spacer(),
                                          CustomImageView(
                                              svgPath:
                                              ImageConstant.imgArrowrightBlueGray600,
                                              height: getSize(24),
                                              width: getSize(24))
                                        ]
                                    )
                                ),
                              ),
                      GestureDetector(
                          onTap: () {
                            print('LogOut tapped');
                            _handleLogout();
                            setState(() {

                            });
                            Future.delayed(const Duration(milliseconds: 100), () {
                              setState(() {

                              });
                            });
                          },
                          child: Padding(
                          padding: getPadding(top: 29, bottom: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgQuestion,
                                    height: getSize(24),
                                    width: getSize(24),
                                  color: _isDarkModeEnabled ? ColorConstant.blueA700 : Colors.black,
                                ),
                                Padding(
                                    padding: getPadding(left: 8, top: 2),
                                    child: Text("LogOut",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.bodyLarge)),
                                Spacer(),
                                CustomImageView(
                                    svgPath:
                                        ImageConstant.imgArrowrightBlueGray600,
                                    height: getSize(24),
                                    width: getSize(24))
                              ])))
                    ]))));
  }

  onTapArrowleft5(BuildContext context) {
    Navigator.pop(context);
  }

  void requestPermission() async{
    // Request permission for notifications
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission for notifications');
    } else {
      print('User declined permission for notifications');
    }
  }

  void getToken() async{
    await FirebaseMessaging.instance.getToken().then(
            (token) {
          setState(() {
            mtoken = token;
            print("My token is $mtoken");
            Constants.setUserToken(mtoken!);
          });
          saveToken(token!);
        }
    );
  }

  void saveToken(String token) async{
    await FirebaseFirestore.instance.collection("user_tokens").doc(_uid).set({
    'token' : token,
    });
  }

  _handleLogout() async {
    await FacebookAuth.instance.logOut();
    await _authService.signOut();
    saveLoginState(false);
    Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
  }
}
