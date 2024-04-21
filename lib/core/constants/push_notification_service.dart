import 'dart:convert';
import 'package:http/http.dart' as http;

void sendPushMessageWithoutAction(String token, String body, String title) async {
  try {
    final response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=AAAA3G9cORM:APA91bGxI3c6NmKvty2ncrQHlG8GUyYgFc_pjEw1-14fM2DP4v-g2HhjXNFEU0Np4eFBugXqAV8a3iyN-OJymaffROwv3V_P7SswPLm4xo_G6ipClqvjEsLG_wmuisW5fzEhRvu9Fpkx'
      },
      body: jsonEncode(
        <String, dynamic>{
          'priority': 'high',
          'data': <String, dynamic>{
            'click-section': 'FLUTTER_NOTIFICATION_CLICK',
            'status': 'done',
            'body': body,
            'title': title,
          },
          'notification': <String, dynamic>{
            'body': body,
            'title': title,
            'android_channel_id': 'stream_it_push_message_without_actions',
          },
          'to': token,
        },
      ),
    );

    if (response.statusCode == 200) {
      print('Push notification sent successfully.');
    } else {
      print('Failed to send push notification. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending push notification: $e');
  }
}

sendPushMessageWithAction(String token, String body, String title, String callId, String userId, String userName) async {
  try {
    final response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=AAAA3G9cORM:APA91bGxI3c6NmKvty2ncrQHlG8GUyYgFc_pjEw1-14fM2DP4v-g2HhjXNFEU0Np4eFBugXqAV8a3iyN-OJymaffROwv3V_P7SswPLm4xo_G6ipClqvjEsLG_wmuisW5fzEhRvu9Fpkx'
      },
      body: jsonEncode(
        <String, dynamic>{
          'priority': 'high',
          'data': <String, dynamic>{
            'click-section': 'ACTION_NOTIFICATION_CLICK',
            'body': body,
            'title': title,
            'call_id': callId,
            'user_id': userId,
            'username': userName,
          },
          'notification': <String, dynamic>{
            'body': body,
            'title': title,
            'android_channel_id': 'stream_it_push_message_with_actions',
          },
          'to': token,
        },
      ),
    );

    if (response.statusCode == 200) {
      print('Push notification sent successfully.');
    } else {
      print('Failed to send push notification. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending push notification: $e');
  }
}
