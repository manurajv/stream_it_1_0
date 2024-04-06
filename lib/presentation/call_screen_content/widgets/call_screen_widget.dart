import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallScreenWidget extends StatelessWidget {
  const CallScreenWidget(
      {Key? key,
        required this.callID,
        required this.userID,
        required this.username})
      : super(key: key);
  final String callID;
  final String userID;
  final String username;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
      335554681, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
      "29062a18d2738582c0aebc8612af367cddc3b3b61be6e0c2761fd7adb79c8d01", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userID,
      userName: username,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}
