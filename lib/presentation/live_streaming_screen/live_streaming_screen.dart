import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stream_it_1_0/routes/app_routes.dart';

class LiveStreamingScreen extends StatefulWidget {
  const LiveStreamingScreen({super.key});

  @override
  State<LiveStreamingScreen> createState() => _LiveStreamingScreenState();
}

class _LiveStreamingScreenState extends State<LiveStreamingScreen> {
  final liveIdController = TextEditingController();
  final String userId = Random().nextInt(900000 + 100000).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text("Your User ID: $userId"),
            SizedBox(height: 30),
            TextFormField(
              controller: liveIdController,
              decoration: InputDecoration(
                labelText: "Join a live by Input an ID",
                border: OutlineInputBorder(),
                // The rest of the code is cut off and not visible
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => AppRoutes.liveFeedCaptureScreen(
                //           liveID: liveIdController.text,
                //           userID: userId,
                //           isHost: true), // LiveScreenView
                //     ) // MaterialPageRoute
                // );
              },
              child: Text("Start a live"),
            ), // ElevatedButton
            SizedBox(height: 15),
            // The rest of the code is cut off and not visible
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => AppRoutes.liveFeedCaptureScreen(
            //               liveID: liveIdController.text,
            //               userID: userId,
            //               isHost: false), // LiveScreenView
            //           // MaterialPageRoute
            //         )); // Navigator.push
            //   },
            //   child: Text("Join a Live"),
            // ), // ElevatedButton
          ],
        ), // Column
      ), // Padding
    ); // Scaffold
  }
}
