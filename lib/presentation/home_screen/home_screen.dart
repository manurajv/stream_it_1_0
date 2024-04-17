import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_it_1_0/presentation/call_screen_content/call_screen_content.dart';
import 'package:stream_it_1_0/presentation/followers_screen/followers_screen.dart';
import '../chat_screen_content/chat_screen_content.dart';
import '../user_account_screen/user_account_screen.dart';
import '../start_streaming_screen/start_streaming_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import '../facebook_feeds_display_screen/facebook_feeds_display_screen.dart';
import 'package:stream_it_1_0/core/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 4;
  bool isAddIconClicked = false;


  static List<Widget> _widgetOptions = <Widget>[
    // Replace with your actual screen contents
    //HomeScreenContent(),
    FacebookFeedsDisplayScreen(),
    //ChatScreenContent(),
    CallScreenContent(),
    StartStreamingScreenContent(), // Middle button with '+' mark
    //SettingsScreenContent(),
    //ProfileScreenContent(),
    FollowersScreen(),
    //UserAccount1Screen(),
    UserAccountScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      // Handle the add icon click
      setState(() {
        isAddIconClicked = true ;
        _selectedIndex = index;
      });
    } else {
      setState(() {
        _selectedIndex = index;
        isAddIconClicked = false; // Reset the flag for other navigation
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0, // Remove default elevation
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.home_48_regular),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.call_48_regular),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: isAddIconClicked
                ? Icon(CupertinoIcons.multiply_circle_fill, size: 45, color: Colors.redAccent) // Change to a different icon
                : Icon(CupertinoIcons.plus_circle_fill, size: 45, color: Colors.redAccent),
            label: 'Plus',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.handshake_32_regular),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.person_48_regular),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
