import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_it_1_0/core/firebase_messaging_handler.dart';
import 'package:stream_it_1_0/core/notification_service.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream_it_1_0/routes/app_routes.dart';
import 'core/constants/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final loggedIn = await isLoggedIn();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Constants.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  NotificationService.initialize();
  FirebaseMessagingHandler.configure();

  ZegoUIKit().initLog().then((value){
    runApp(MyApp(isLoggedIn: loggedIn));
  });


}

Future<bool> isLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

Future<void> saveLoginState(bool isLoggedIn) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', isLoggedIn);
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: FirebaseMessagingHandler.navigatorKey,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      title: 'stream_it',
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? AppRoutes.homeScreen : AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }

}