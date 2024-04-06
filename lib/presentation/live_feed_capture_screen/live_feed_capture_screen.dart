import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LiveFeedCaptureScreen extends StatelessWidget {
  final String liveID, userID;
  final bool isHost;

  LiveFeedCaptureScreen({required this.liveID, required this.userID, this.isHost = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID:
        1236203913, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign:
        "53c196ce1cd90e28ae8467f24718ae5e4ac1f800796dfe04e36c4f9773f4c7b9", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: 'user_id',
        userName: 'user_name',
        liveID: liveID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}
