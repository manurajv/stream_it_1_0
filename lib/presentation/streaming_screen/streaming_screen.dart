import 'package:flutter/material.dart';
//import 'customized_screen_values.dart';

class StreamingScreen extends StatefulWidget {
  const StreamingScreen({Key? key}) : super(key: key);

  @override
  State<StreamingScreen> createState() => _StreamingScreenState();
}

class _StreamingScreenState extends State<StreamingScreen> {
  bool _isStreaming = false;
  bool _isMuted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Stream preview
            Positioned.fill(
              child: AspectRatio(
                aspectRatio: 16 / 9, // Adjust based on stream aspect ratio
                child: _getStreamPreviewWidget(),
              ),
            ),
            // Controls
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Start/stop button
                  ElevatedButton(
                    onPressed: _toggleStream,
                    child: Text(_isStreaming ? 'Stop Streaming' : 'Start Streaming'),
                  ),
                  // Mute/unmute button
                  IconButton(
                    onPressed: _toggleMute,
                    icon: Icon(_isMuted ? Icons.mic_off : Icons.mic),
                  ),
                ],
              ),
            ),
            // Comments and reactions (placeholder)
            // ... implement comments and reactions section
          ],
        ),
      ),
    );
  }

  Widget _getStreamPreviewWidget() {
    // Replace with your actual stream preview implementation
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          _isStreaming ? 'Streaming...' : 'Preview',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void _toggleStream() {
    setState(() {
      _isStreaming = !_isStreaming;
    });
    // Handle starting/stopping the stream (integrate with Facebook Live API)
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
    });
    // Handle muting/unmuting the microphone
  }
}
