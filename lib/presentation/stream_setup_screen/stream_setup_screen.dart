import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screen_customization_screen/screen_customization_screen.dart';
import '../streaming_screen/streaming_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class StreamSetupScreen extends StatefulWidget {
  const StreamSetupScreen({Key? key}) : super(key: key);

  @override
  State<StreamSetupScreen> createState() => _StreamSetupScreenState();
}

class _StreamSetupScreenState extends State<StreamSetupScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _streamAudience = 'Public';
  String _screenOrientation = 'Portrait';
  String _selectedAccount = '';
  String _selectedVideoQuality = '720p';
  bool _isConnected = false;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          // Enforce portrait orientation within this builder
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Stream Setup'),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Account selection button at the top
                  Container(
                    height: 15.0,
                    width: 15.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _isConnected ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white.withOpacity(0.6),
                        // Removed for semi-transparent background
                        //isScrollControlled: true, // Adjust if content exceeds screen height
                        barrierColor: Colors.blueAccent.withOpacity(0.6),
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              final screenHeight = MediaQuery
                                  .of(context)
                                  .size
                                  .height;
                              final screenWidth = MediaQuery
                                  .of(context)
                                  .size
                                  .width;
                              final bottomSheetHeight = (screenHeight - 100.0) * 0.3;
                              final bottomSheetWidth = screenWidth;

                              return Container(
                                  height: bottomSheetHeight,
                                  width: bottomSheetWidth,
                                  margin: EdgeInsets.only(
                                    top: bottomSheetHeight / 6,
                                    left: screenWidth / 10,
                                  ),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Container(
                                          height: bottomSheetHeight,
                                          width: bottomSheetWidth,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomLeft: Radius.circular(20.0),
                                              bottomRight: Radius.circular(20.0),
                                            ),
                                          ),
                                          child: ListView(
                                            children: [
                                              // ListTile for each account option (with placeholder for authentication logic)
                                              ListTile(
                                                leading: const Icon(
                                                    FontAwesomeIcons.facebook),
                                                trailing: _isConnected ?
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      'https://img.freepik.com/free-vector/golden-elegant-logo-with-frame_52683-13462.jpg?w=740&t=st=1703238737~exp=1703239337~hmac=88374c9701bca085f9256c5c4cdeb66c6466deaea85ea5664ea4f4f375275e28'),
                                                ) : ElevatedButton(
                                                  onPressed: () {
                                                    // Connect to Facebook account
                                                  },
                                                  child: const Text('Connect'),
                                                ),
                                                title: const Text('Facebook'),
                                                onTap: () {
                                                  // Handle Facebook account selection or actions
                                                },
                                              ),
                                              ListTile(
                                                leading: const Icon(
                                                    FontAwesomeIcons.google),
                                                trailing: _isConnected ?
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      'https://img.freepik.com/free-vector/golden-elegant-logo-with-frame_52683-13462.jpg?w=740&t=st=1703238737~exp=1703239337~hmac=88374c9701bca085f9256c5c4cdeb66c6466deaea85ea5664ea4f4f375275e28'),
                                                ) : ElevatedButton(
                                                  onPressed: () {
                                                    // Connect to Facebook account
                                                  },
                                                  child: const Text('Connect'),
                                                ),
                                                title: const Text('Gmail'),
                                                onTap: () {
                                                  // Handle Facebook account selection or actions
                                                },
                                              ),
                                              ListTile(
                                                leading: const Icon(
                                                    FontAwesomeIcons.youtube),
                                                trailing: _isConnected ?
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      'https://img.freepik.com/free-vector/golden-elegant-logo-with-frame_52683-13462.jpg?w=740&t=st=1703238737~exp=1703239337~hmac=88374c9701bca085f9256c5c4cdeb66c6466deaea85ea5664ea4f4f375275e28'),
                                                ) : ElevatedButton(
                                                  onPressed: () {
                                                    // Connect to Facebook account
                                                  },
                                                  child: const Text('Connect'),
                                                ),
                                                title: const Text('YouTube'),
                                                onTap: () {
                                                  // Handle Facebook account selection or actions
                                                },
                                              ),
                                              // ... add more options as needed
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Text(_selectedAccount.isEmpty
                        ? 'Connect Account'
                        : _selectedAccount),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Stream Title',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Stream Description',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButton<String>(
                    value: _streamAudience,
                    items: const [
                      DropdownMenuItem(child: Text('Public'), value: 'Public'),
                      DropdownMenuItem(
                          child: Text('Friends Only'), value: 'Friends'),
                      DropdownMenuItem(child: Text('Private'), value: 'Private'),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _streamAudience = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButton<String>(
                    value: _screenOrientation,
                    items: const [
                      DropdownMenuItem(child: Text('Portrait'), value: 'Portrait'),
                      DropdownMenuItem(
                          child: Text('Landscape'), value: 'Landscape'),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _screenOrientation = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 24.0),
                  DropdownButton<String>(
                    value: _selectedVideoQuality,
                    items: const [
                      DropdownMenuItem(child: Text('720p'), value: '720p'),
                      DropdownMenuItem(child: Text('480p'), value: '480p'),
                      // ... add more options as needed
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedVideoQuality = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_screenOrientation == 'Landscape') {
                        // Use a custom route for landscape orientation
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              StreamCustomizationScreen(
                                selectedOrientation: _screenOrientation,
                              )
                          ),
                        );
                      } else {
                        // Use default navigation for portrait or other orientations
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              StreamCustomizationScreen(
                                selectedOrientation: _screenOrientation,
                              )),
                        );
                      }
                    },
                    child: const Text('Customize Streaming View'),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StreamingScreen()),
                      );
                    },
                    child: const Text('Ready for Streaming'),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}