import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/presentation/review_prompt_dialog/review_prompt_dialog.dart';
import 'package:stream_it_1_0/presentation/stream_setup_screen/stream_setup_screen.dart';

class AppNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: getHorizontalSize(375),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          decoration: AppDecoration.fillWhiteA700,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                        child: Text("App Navigation",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style:
                                                AppStyle.txtRobotoRegular20))),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: getPadding(left: 20),
                                        child: Text(
                                            "Check app's UI from the below screens",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style:
                                                AppStyle.txtRobotoRegular16))),
                                Padding(
                                    padding: getPadding(top: 5),
                                    child: Divider(
                                        height: getVerticalSize(1),
                                        thickness: getVerticalSize(1),
                                        color: ColorConstant.black900))
                              ])),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  decoration: AppDecoration.fillWhiteA700,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              onTapFriendList(context);
                                            },
                                            child: Container(
                                                decoration:
                                                    AppDecoration.fillWhiteA700,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 20,
                                                                      top: 10,
                                                                      right: 20,
                                                                      bottom:
                                                                          10),
                                                              child: Text(
                                                                  "Friend List",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: AppStyle
                                                                      .txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 5),
                                                          child: Divider(
                                                              height:
                                                                  getVerticalSize(
                                                                      1),
                                                              thickness:
                                                                  getVerticalSize(
                                                                      1),
                                                              color: ColorConstant
                                                                  .blueGray40001))
                                                    ]))),
                                        GestureDetector(
                                            onTap: () {
                                              onTapReviewPrompt(context);
                                            },
                                            child: Container(
                                                decoration:
                                                    AppDecoration.fillWhiteA700,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 20,
                                                                      top: 10,
                                                                      right: 20,
                                                                      bottom:
                                                                          10),
                                                              child: Text(
                                                                  "Review Prompt",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: AppStyle
                                                                      .txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 5),
                                                          child: Divider(
                                                              height:
                                                                  getVerticalSize(
                                                                      1),
                                                              thickness:
                                                                  getVerticalSize(
                                                                      1),
                                                              color: ColorConstant
                                                                  .blueGray40001))
                                                    ]))),
                                        // GestureDetector(
                                        //     onTap: () {
                                        //       onTapQRcodes(context);
                                        //     },
                                        //     child: Container(
                                        //         decoration:
                                        //             AppDecoration.fillWhiteA700,
                                        //         child: Column(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment.start,
                                        //             children: [
                                        //               Align(
                                        //                   alignment: Alignment
                                        //                       .centerLeft,
                                        //                   child: Padding(
                                        //                       padding:
                                        //                           getPadding(
                                        //                               left: 20,
                                        //                               top: 10,
                                        //                               right: 20,
                                        //                               bottom:
                                        //                                   10),
                                        //                       child: Text(
                                        //                           "QR codes",
                                        //                           overflow:
                                        //                               TextOverflow
                                        //                                   .ellipsis,
                                        //                           textAlign:
                                        //                               TextAlign
                                        //                                   .center,
                                        //                           style: AppStyle
                                        //                               .txtRobotoRegular20))),
                                        //               Padding(
                                        //                   padding: getPadding(
                                        //                       top: 5),
                                        //                   child: Divider(
                                        //                       height:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       thickness:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       color: ColorConstant
                                        //                           .blueGray40001))
                                        //             ]))),
                                        // GestureDetector(
                                        //     onTap: () {
                                        //       onTapPreviewvideo(context);
                                        //     },
                                        //     child: Container(
                                        //         decoration:
                                        //             AppDecoration.fillWhiteA700,
                                        //         child: Column(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment.start,
                                        //             children: [
                                        //               Align(
                                        //                   alignment: Alignment
                                        //                       .centerLeft,
                                        //                   child: Padding(
                                        //                       padding:
                                        //                           getPadding(
                                        //                               left: 20,
                                        //                               top: 10,
                                        //                               right: 20,
                                        //                               bottom:
                                        //                                   10),
                                        //                       child: Text(
                                        //                           "preview video",
                                        //                           overflow:
                                        //                               TextOverflow
                                        //                                   .ellipsis,
                                        //                           textAlign:
                                        //                               TextAlign
                                        //                                   .center,
                                        //                           style: AppStyle
                                        //                               .txtRobotoRegular20))),
                                        //               Padding(
                                        //                   padding: getPadding(
                                        //                       top: 5),
                                        //                   child: Divider(
                                        //                       height:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       thickness:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       color: ColorConstant
                                        //                           .blueGray40001))
                                        //             ]))),
                                        // GestureDetector(
                                        //     onTap: () {
                                        //       onTapFacebookFeedsDisplay(
                                        //           context);
                                        //     },
                                        //     child: Container(
                                        //         decoration:
                                        //             AppDecoration.fillWhiteA700,
                                        //         child: Column(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment.start,
                                        //             children: [
                                        //               Align(
                                        //                   alignment: Alignment
                                        //                       .centerLeft,
                                        //                   child: Padding(
                                        //                       padding:
                                        //                           getPadding(
                                        //                               left: 20,
                                        //                               top: 10,
                                        //                               right: 20,
                                        //                               bottom:
                                        //                                   10),
                                        //                       child: Text(
                                        //                           "Facebook Feeds Display",
                                        //                           overflow:
                                        //                               TextOverflow
                                        //                                   .ellipsis,
                                        //                           textAlign:
                                        //                               TextAlign
                                        //                                   .center,
                                        //                           style: AppStyle
                                        //                               .txtRobotoRegular20))),
                                        //               Padding(
                                        //                   padding: getPadding(
                                        //                       top: 5),
                                        //                   child: Divider(
                                        //                       height:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       thickness:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       color: ColorConstant
                                        //                           .blueGray40001))
                                        //             ]))),
                                        GestureDetector(
                                            onTap: () {
                                              onTapFollowers(context);
                                            },
                                            child: Container(
                                                decoration:
                                                    AppDecoration.fillWhiteA700,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 20,
                                                                      top: 10,
                                                                      right: 20,
                                                                      bottom:
                                                                          10),
                                                              child: Text(
                                                                  "Followers",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: AppStyle
                                                                      .txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 5),
                                                          child: Divider(
                                                              height:
                                                                  getVerticalSize(
                                                                      1),
                                                              thickness:
                                                                  getVerticalSize(
                                                                      1),
                                                              color: ColorConstant
                                                                  .blueGray40001))
                                                    ]))),
                                        // GestureDetector(
                                        //     onTap: () {
                                        //       onTapSignUp(context);
                                        //     },
                                        //     child: Container(
                                        //         decoration:
                                        //             AppDecoration.fillWhiteA700,
                                        //         child: Column(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment.start,
                                        //             children: [
                                        //               Align(
                                        //                   alignment: Alignment
                                        //                       .centerLeft,
                                        //                   child: Padding(
                                        //                       padding:
                                        //                           getPadding(
                                        //                               left: 20,
                                        //                               top: 10,
                                        //                               right: 20,
                                        //                               bottom:
                                        //                                   10),
                                        //                       child: Text(
                                        //                           "Sign Up",
                                        //                           overflow:
                                        //                               TextOverflow
                                        //                                   .ellipsis,
                                        //                           textAlign:
                                        //                               TextAlign
                                        //                                   .center,
                                        //                           style: AppStyle
                                        //                               .txtRobotoRegular20))),
                                        //               Padding(
                                        //                   padding: getPadding(
                                        //                       top: 5),
                                        //                   child: Divider(
                                        //                       height:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       thickness:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       color: ColorConstant
                                        //                           .blueGray40001))
                                        //             ]))),
                                        GestureDetector(
                                            onTap: () {
                                              onTapUserAccount(context);
                                            },
                                            child: Container(
                                                decoration:
                                                    AppDecoration.fillWhiteA700,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 20,
                                                                      top: 10,
                                                                      right: 20,
                                                                      bottom:
                                                                          10),
                                                              child: Text(
                                                                  "User Account",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: AppStyle
                                                                      .txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 5),
                                                          child: Divider(
                                                              height:
                                                                  getVerticalSize(
                                                                      1),
                                                              thickness:
                                                                  getVerticalSize(
                                                                      1),
                                                              color: ColorConstant
                                                                  .blueGray40001))
                                                    ]))),
                                        // GestureDetector(
                                        //     onTap: () {
                                        //       onTapSignupLoginModule(context);
                                        //     },
                                        //     child: Container(
                                        //         decoration:
                                        //             AppDecoration.fillWhiteA700,
                                        //         child: Column(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment.start,
                                        //             children: [
                                        //               Align(
                                        //                   alignment: Alignment
                                        //                       .centerLeft,
                                        //                   child: Padding(
                                        //                       padding:
                                        //                           getPadding(
                                        //                               left: 20,
                                        //                               top: 10,
                                        //                               right: 20,
                                        //                               bottom:
                                        //                                   10),
                                        //                       child: Text(
                                        //                           "Signup/Login Module",
                                        //                           overflow:
                                        //                               TextOverflow
                                        //                                   .ellipsis,
                                        //                           textAlign:
                                        //                               TextAlign
                                        //                                   .center,
                                        //                           style: AppStyle
                                        //                               .txtRobotoRegular20))),
                                        //               Padding(
                                        //                   padding: getPadding(
                                        //                       top: 5),
                                        //                   child: Divider(
                                        //                       height:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       thickness:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       color: ColorConstant
                                        //                           .blueGray40001))
                                        //             ]))),
                                        // GestureDetector(
                                        //     onTap: () {
                                        //       onTapLikePost(context);
                                        //     },
                                        //     child: Container(
                                        //         decoration:
                                        //             AppDecoration.fillWhiteA700,
                                        //         child: Column(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment.start,
                                        //             children: [
                                        //               Align(
                                        //                   alignment: Alignment
                                        //                       .centerLeft,
                                        //                   child: Padding(
                                        //                       padding:
                                        //                           getPadding(
                                        //                               left: 20,
                                        //                               top: 10,
                                        //                               right: 20,
                                        //                               bottom:
                                        //                                   10),
                                        //                       child: Text(
                                        //                           "Like Post",
                                        //                           overflow:
                                        //                               TextOverflow
                                        //                                   .ellipsis,
                                        //                           textAlign:
                                        //                               TextAlign
                                        //                                   .center,
                                        //                           style: AppStyle
                                        //                               .txtRobotoRegular20))),
                                        //               Padding(
                                        //                   padding: getPadding(
                                        //                       top: 5),
                                        //                   child: Divider(
                                        //                       height:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       thickness:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       color: ColorConstant
                                        //                           .blueGray40001))
                                        //             ]))),
                                        GestureDetector(
                                            onTap: () {
                                              onTapStreamSetupScreen(context);
                                            },
                                            child: Container(
                                                decoration:
                                                    AppDecoration.fillWhiteA700,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 20,
                                                                      top: 10,
                                                                      right: 20,
                                                                      bottom:
                                                                          10),
                                                              child: Text(
                                                                  "Screen Live Streaming",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: AppStyle
                                                                      .txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 5),
                                                          child: Divider(
                                                              height:
                                                                  getVerticalSize(
                                                                      1),
                                                              thickness:
                                                                  getVerticalSize(
                                                                      1),
                                                              color: ColorConstant
                                                                  .blueGray40001))
                                                    ]))),
                                        GestureDetector(
                                            onTap: () {
                                              onTapLiveStreaming(context);
                                            },
                                            child: Container(
                                                decoration:
                                                    AppDecoration.fillWhiteA700,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 20,
                                                                      top: 10,
                                                                      right: 20,
                                                                      bottom:
                                                                          10),
                                                              child: Text(
                                                                  "Camera Live Streaming",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: AppStyle
                                                                      .txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 5),
                                                          child: Divider(
                                                              height:
                                                                  getVerticalSize(
                                                                      1),
                                                              thickness:
                                                                  getVerticalSize(
                                                                      1),
                                                              color: ColorConstant
                                                                  .blueGray40001))
                                                    ]))),
                                        // GestureDetector(
                                        //     onTap: () {
                                        //       onTapUserAccount1(context);
                                        //     },
                                        //     child: Container(
                                        //         decoration:
                                        //             AppDecoration.fillWhiteA700,
                                        //         child: Column(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment.start,
                                        //             children: [
                                        //               Align(
                                        //                   alignment: Alignment
                                        //                       .centerLeft,
                                        //                   child: Padding(
                                        //                       padding:
                                        //                           getPadding(
                                        //                               left: 20,
                                        //                               top: 10,
                                        //                               right: 20,
                                        //                               bottom:
                                        //                                   10),
                                        //                       child: Text(
                                        //                           "User Account",
                                        //                           overflow:
                                        //                               TextOverflow
                                        //                                   .ellipsis,
                                        //                           textAlign:
                                        //                               TextAlign
                                        //                                   .center,
                                        //                           style: AppStyle
                                        //                               .txtRobotoRegular20))),
                                        //               Padding(
                                        //                   padding: getPadding(
                                        //                       top: 5),
                                        //                   child: Divider(
                                        //                       height:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       thickness:
                                        //                           getVerticalSize(
                                        //                               1),
                                        //                       color: ColorConstant
                                        //                           .blueGray40001))
                                        //             ])))
                                      ]))))
                    ]))));
  }

  onTapFriendList(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreen, arguments: {
      'tabIndex': 2,  // Pass the desired index (1 for 2nd tab)
    });
  }

  onTapReviewPrompt(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: ReviewPromptDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.only(left: 0),
            ));
  }

  onTapQRcodes(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.qrCodesScreen);
  }

  onTapPreviewvideo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.previewVideoScreen);
  }

  onTapFacebookFeedsDisplay(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.facebookFeedsDisplayScreen);
  }

  onTapFollowers(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.followersScreen);
  }

  onTapSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }

  onTapUserAccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userAccountScreen);
  }

  onTapSignupLoginModule(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signupLoginModuleScreen);
  }

  onTapLikePost(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.likePostScreen);
  }

  // onTapLiveFeedCapture(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.liveFeedCaptureScreen);
  // }

  onTapLiveStreaming(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.liveStreamingScreen);
  }

  onTapStreamSetupScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.streamSetupScreen);
  }

}
