import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stream_it_1_0/presentation/call_screen_content/widgets/call_screen_widget.dart';
import 'package:stream_it_1_0/presentation/facebook_feeds_display_screen/facebook_feeds_display_screen.dart';
import 'package:stream_it_1_0/presentation/home_screen/home_screen.dart';

class FirebaseMessagingHandler {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void configure() async {
    // Request notification permissions
    await _firebaseMessaging.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );

    // Initialize notifications plugin
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings("@drawable/app_icon_o_r"); // Replace with your icon name
    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await _notificationsPlugin.initialize(initializationSettings);

    // Handle incoming messages while the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Ensure that context is available before calling _handleMessage
      if (navigatorKey.currentContext != null) {
        _handleMessage(message, navigatorKey.currentContext!);
      } else {
        print("Error: Could not retrieve context.");
      }
    });

    // Handle notification taps when the app is in the background/terminated
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // Helper Functions
  static void _handleMessage(RemoteMessage message, BuildContext? context) {
    final customData = message.data;
    print('Received custom data: $customData');

    // Check the value of 'click-section' to determine the type of notification
    final clickSection = customData['click-section'];
    if (clickSection == 'FLUTTER_NOTIFICATION_CLICK') {
      // Handle push notification without action
      _showNotificationWithoutAction(message);
    } else if (clickSection == 'ACTION_NOTIFICATION_CLICK') {
      // Handle push notification with action
      _showNotificationWithAction(message);
    }

    // Attempt navigation (only if the context is available)
    if (context != null) {
      _navigateToScreen(customData);
    } else {
      print("Error: Could not retrieve context.");
    }
  }

  static void _showNotificationWithoutAction(RemoteMessage message) {
    try {
      final title = message.notification?.title ?? 'Default Title';
      final body = message.notification?.body ?? 'Default Body';

      // Notification without actions
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'stream_it_push_message_without_actions', // Replace with your channel ID
        'stream_it', // Replace with your channel name
        channelDescription: 'Your channel description',
        importance: Importance.max,
        priority: Priority.high,
      );

      const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

      _notificationsPlugin.show(
        1, // Notification ID
        title,
        body,
        platformChannelSpecifics,
        payload: jsonEncode(message.data), // Pass the whole data as payload
      );
    } catch (e) {
      print('Error displaying notification: $e');
    }
  }

  static void _showNotificationWithAction(RemoteMessage message) {
    try {
      final title = message.notification?.title ?? 'Default Title';
      final body = message.notification?.body ?? 'Default Body';

      // Notification with actions
      const AndroidNotificationDetails androidPlatformChannelSpecificsWithActions =
      AndroidNotificationDetails(
        'stream_it_push_message_with_actions', // Replace with your channel ID
        'stream_it', // Replace with your channel name
        channelDescription: 'Your channel description',
        importance: Importance.max,
        priority: Priority.high,
        actions: <AndroidNotificationAction>[
          AndroidNotificationAction(
            'action_decline',
            'Decline',
            titleColor: Color.fromARGB(255, 255, 0, 0),
          ),
          AndroidNotificationAction(
            'action_answer',
            'Answer',
            titleColor: Color.fromARGB(255, 0, 0, 255),
            showsUserInterface: true,

          ),
        ],
      );

      const NotificationDetails platformChannelSpecificsWithActions =
      NotificationDetails(android: androidPlatformChannelSpecificsWithActions);

      _notificationsPlugin.show(
        1, // Notification ID
        title,
        body,
        platformChannelSpecificsWithActions,
        payload: jsonEncode(message.data), // Pass the whole data as payload
      );
    } catch (e) {
      print('Error displaying notification: $e');
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // Initialize notifications plugin (if notification tap should open the app)
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings("@drawable/app_icon_o_r");
    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await _notificationsPlugin.initialize(initializationSettings);

    // Extract payload
    final data = message.data;

    // ... your existing logic to navigate based on the payload ...
    if (data['click_section'] == 'ACTION_NOTIFICATION_CLICK') {
      // Notification with actions
      final title = message.notification?.title ?? 'Default Title';
      final body = message.notification?.body ?? 'Default Body';

      // Define notification actions
      final actionAnswer = AndroidNotificationAction(
        'action_answer',
        'Answer',
        titleColor: Color.fromARGB(255, 0, 0, 255),
        showsUserInterface: true,
      );
      final actionDecline = AndroidNotificationAction(
        'action_decline',
        'Decline',
        titleColor: Color.fromARGB(255, 255, 0, 0),
      );

      // Define notification details with actions
      final AndroidNotificationDetails androidPlatformChannelSpecificsWithActions =
      AndroidNotificationDetails(
        'stream_it_push_message_with_actions', // Replace with your channel ID
        'stream_it', // Replace with your channel name
        channelDescription: 'Your channel description',
        importance: Importance.max,
        priority: Priority.high,
        actions: [actionAnswer, actionDecline],
      );

      final NotificationDetails platformChannelSpecificsWithActions =
      NotificationDetails(android: androidPlatformChannelSpecificsWithActions);

      // Display the notification with actions
      await _notificationsPlugin.show(
        1, // Notification ID
        title,
        body,
        platformChannelSpecificsWithActions,
        payload: jsonEncode(data), // Pass the whole data as payload
      );
    }
  }



  static void _navigateToScreen(Map<String, dynamic> customData) {
    final String clickSection = customData['click-section'];

    // Check the value of 'click-section' and navigate accordingly
    if (clickSection == 'FLUTTER_NOTIFICATION_CLICK') {
      // Navigate to a different page when 'click-section' is 'FLUTTER_NOTIFICATION_CLICK'
      navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => HomeScreen(selectedIndex: 0),
      ));
    } else if (clickSection == 'ACTION_NOTIFICATION_CLICK') {
      // Navigate to the CallScreenWidget when 'click-section' is 'ACTION_NOTIFICATION_CLICK'
      navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => CallScreenWidget(
          callID: customData['call_id'],
          userID: customData['user_id'],
          username: customData['username'],
        ),
      ));
    }
  }

}