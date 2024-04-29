import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/core/firebase_messaging_handler.dart';
import 'package:stream_it_1_0/core/notification_service.dart';
import 'package:stream_it_1_0/presentation/facebook_feeds_display_screen/facebook_feeds_display_screen.dart';
import 'package:stream_it_1_0/presentation/home_screen/home_screen.dart';
import 'package:stream_it_1_0/theme/custom_button_styles.dart';
import 'package:stream_it_1_0/theme/custom_text_styles.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream_it_1_0/routes/app_routes.dart';
import 'core/constants/constants.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

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
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, required this.isLoggedIn, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
        textTheme: CustomTextStyles.lightTextTheme,
        buttonTheme: CustomButtonStyles.lightButtonTheme,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
        textTheme: CustomTextStyles.darkTextTheme,
        buttonTheme: CustomButtonStyles.darkButtonTheme,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        navigatorKey: FirebaseMessagingHandler.navigatorKey,
        theme: theme.copyWith(
          visualDensity: VisualDensity.standard,
        ),
        darkTheme: darkTheme.copyWith(
          visualDensity: VisualDensity.standard,
        ),
        title: 'stream_it',
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedIn ? AppRoutes.homeScreen : AppRoutes.splashScreen,
        routes: AppRoutes.routes,
      ),
      //debugShowFloatingThemeButton: true,
    );
  }


}