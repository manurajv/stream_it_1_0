import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/presentation/call_screen_content/call_screen_content.dart';
import 'package:stream_it_1_0/presentation/chat_screen_content/chat_screen_content.dart';
import 'package:stream_it_1_0/presentation/friend_list_screen/friend_list_screen.dart';
import 'package:stream_it_1_0/presentation/home_screen/home_screen.dart';
import 'package:stream_it_1_0/presentation/home_screen_content/home_screen_content.dart';
import 'package:stream_it_1_0/presentation/login_screen/login_screen.dart';
import 'package:stream_it_1_0/presentation/qr_codes_screen/qr_codes_screen.dart';
import 'package:stream_it_1_0/presentation/preview_video_screen/preview_video_screen.dart';
import 'package:stream_it_1_0/presentation/facebook_feeds_display_screen/facebook_feeds_display_screen.dart';
import 'package:stream_it_1_0/presentation/followers_screen/followers_screen.dart';
import 'package:stream_it_1_0/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:stream_it_1_0/presentation/start_streaming_screen/start_streaming_screen.dart';
import 'package:stream_it_1_0/presentation/stream_setup_screen/stream_setup_screen.dart';
import 'package:stream_it_1_0/presentation/streaming_screen/streaming_screen.dart';
import 'package:stream_it_1_0/presentation/user_account_screen/user_account_screen.dart';
import 'package:stream_it_1_0/presentation/signup_login_module_screen/signup_login_module_screen.dart';
import 'package:stream_it_1_0/presentation/like_post_screen/like_post_screen.dart';
import 'package:stream_it_1_0/presentation/live_feed_capture_screen/live_feed_capture_screen.dart';
import 'package:stream_it_1_0/presentation/live_streaming_screen/live_streaming_screen.dart';
import 'package:stream_it_1_0/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:stream_it_1_0/presentation/camera_live_view_page/camera_live_view_page.dart';
import 'package:stream_it_1_0/presentation/splash_screen/splash_screen.dart';
import 'package:stream_it_1_0/routes/app_routes.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';

  static const String callScreenContent = '/call_screen_content';

  static const String friendListScreen = '/friend_list_screen';

  static const String chatScreenContent = '/chat_screen_content';

  static const String homeScreenContent = '/home_screen_content';

  static const String qrCodesScreen = '/qr_codes_screen';

  static const String previewVideoScreen = '/preview_video_screen';

  static const String facebookFeedsDisplayScreen = '/facebook_feeds_display_screen';

  static const String followersScreen = '/followers_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String userAccountScreen = '/user_account_screen';

  static const String signupLoginModuleScreen = '/signup_login_module_screen';

  static const String likePostScreen = '/like_post_screen';

  //static const String liveFeedCaptureScreen = '/live_feed_capture_screen';

  static const String liveStreamingScreen = '/live_streaming_screen';

  static const String userAccount1Screen = '/user_account1_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String loginScreen = '/login_screen';

  static const String startStreamingScreenContent = '/start_streaming_screen_content';

  static const String streamSetupScreen = '/stream_setup_screen';

  static const String streamingScreen = '/streaming_screen';

  static const String cameraLiveViewPage = '/camera_live_view_page';

  static const String splashScreen = '/splash_screen';

  // static Widget liveFeedCaptureScreen({required String liveID, required String userID, required bool isHost}) {
  //   return LiveFeedCaptureScreen(liveID: liveID, userID: userID, isHost: isHost);
  // }


  static Map<String, WidgetBuilder> routes = {
    homeScreen: (context) => HomeScreen(),
    //callScreenContent: (context) => CallScreenContent(),
    friendListScreen: (context) => FriendListScreen(),
    chatScreenContent: (context) => ChatScreenContent(),
    homeScreenContent: (context) => HomeScreenContent(),
    qrCodesScreen: (context) => QrCodesScreen(),
    previewVideoScreen: (context) => PreviewVideoScreen(),
    facebookFeedsDisplayScreen: (context) => FacebookFeedsDisplayScreen(),
    followersScreen: (context) => FollowersScreen(),
    signUpScreen: (context) => SignUpScreen(),
    userAccountScreen: (context) => UserAccountScreen(),
    //signupLoginModuleScreen: (context) => SignupLoginModuleScreen(),
    likePostScreen: (context) => LikePostScreen(),
    //liveFeedCaptureScreen: (context) => LiveFeedCaptureScreen(),
    liveStreamingScreen: (context) => LiveStreamingScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    loginScreen: (context) => LoginScreen(),
    startStreamingScreenContent: (context) => StartStreamingScreenContent(),
    streamSetupScreen: (context) => StreamSetupScreen(),
    streamingScreen: (context) => StreamingScreen(),
    cameraLiveViewPage: (context) => CameraLiveViewPage(),
    splashScreen: (context) => SplashScreen(),
  };

}
