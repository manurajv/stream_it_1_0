import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/core/constants/constants.dart';
import '../../core/constants/push_notification_service.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import 'widgets/call_screen_widget.dart';
import 'package:stream_it_1_0/widgets/custom_button.dart';
import 'package:stream_it_1_0/widgets/custom_text_form_field.dart';

class CallScreenContent extends StatefulWidget {
  const CallScreenContent({Key? key}) : super(key: key);
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<CallScreenContent> createState() => _CallScreenContentState();
}

class _CallScreenContentState extends State<CallScreenContent> {
  TextEditingController callIdController = TextEditingController();
  String userName = Constants.getFacebookName().toString();
  String? userId;
  String? selectedUser;
  List<String> followedUserIds = [];
  List<String> followedUserNames = [];
  List<String> followedUserImageUrls = []; // Added list for user image URLs
  String? _token;
  String? _reciever;

  @override
  void initState() {
    super.initState();
    // Fetch user ID from Firebase
    userId = Constants.getUId();
    // Fetch followed user IDs, names, and images
    _fetchFollowedUserData();
  }

  Future<void> _fetchFollowedUserData() async {
    if (userId != null) {
      try {
        followedUserIds = await getFollowedUserIDs(userId!);
        followedUserNames = await getUserNames(followedUserIds);
        followedUserImageUrls = await getUserImages(followedUserIds); // Fetch user images
        // Update state after fetching followed user data
        setState(() {});
      } catch (e) {
        print("Error fetching followed user data: $e");
      }
    } else {
      print("User ID is null.");
    }
  }

  Future<String?> _getUserToken() async {
    try {
      selectedUser;
      var tokenDoc = await FirebaseFirestore.instance.collection('user_tokens').doc(selectedUser).get();
      if (tokenDoc.exists) {
        if (mounted) {
          setState(() {
            _token = tokenDoc.data()?['token'];
          });
        }
        print(_token);
        return tokenDoc.data()?['token'];
      } else {
        print('Token not found for user with ID: $selectedUser');
        return null;
      }
    } catch (e) {
      print('Error fetching token for user with ID: $selectedUser\nError: $e');
      return null;
    }
  }

  Future<String?> _getUserName() async {
    try {
      selectedUser;
      var userDoc = await FirebaseFirestore.instance.collection('users').doc(selectedUser).get();
      if (userDoc.exists) {
        if (mounted) {
          setState(() {
            _reciever = userDoc.data()?['name'];
          });
        }
        print(_reciever);
        return userDoc.data()?['name'];
      } else {
        print('User not found with ID: $selectedUser');
        return null;
      }
    } catch (e) {
      print('Error fetching user with ID: $selectedUser\nError: $e');
      return null;
    }
  }



  @override
  Widget build(BuildContext context) {
    // Check if user is logged in
    if (userId == null) {
      return CircularProgressIndicator(); // Show loading indicator while authentication state is being checked
    }
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: getVerticalSize(51),
          leadingWidth: 40,
          centerTitle: true,
          title: AppbarTitle(text: "Stream it Call Option"),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  userName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: CustomTextFormField(
                    controller: callIdController,
                    hintText: 'Enter Call ID',
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: followedUserNames.length,
                    itemBuilder: (context, index) {
                      String userId = followedUserIds[index];
                      String userName = followedUserNames[index];
                      String userImageUrl = followedUserImageUrls[index]; // Fetch user image URL
                      return ListTile(
                        leading: CustomImageView(
                          url: userImageUrl,
                          radius: BorderRadius.circular(getHorizontalSize(50)),
                        ),
                        title: Text(
                          userName,
                          style: selectedUser == userId
                              ? Theme.of(context).textTheme.headlineSmall?.copyWith(color: ColorConstant.blueA700) // Change color for selected user
                              : Theme.of(context).textTheme.headlineSmall,
                        ),
                        onTap: () {
                          setState(() {
                            selectedUser = userId;
                            callIdController.text = userId.substring(20, 26);
                            _getUserToken();
                            _getUserName();
                          });
                        },
                        selected: selectedUser == userId,
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  onTap: () async {
                    if (_token != null) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => CallScreenWidget(
                          callID: callIdController.text,
                          userID: userId!,
                          username: userName,
                        ),
                      ),
                      );
                      await sendPushMessageWithAction(
                        _token!,
                         'is calling',
                        Constants.getFacebookName().toString(),
                        callIdController.text,
                        selectedUser!,
                        _reciever!,
                      );
                    } else {
                      print('Token is null. Unable to send push notification.');
                    }
                   },
                  text: "Join Call",
                  shape: ButtonShape.RoundedBorder6,
                  padding: ButtonPadding.PaddingAll8,
                  variant: ButtonVariant.FillBlueA700,
                  fontStyle: ButtonFontStyle.GilroyMedium16,
                  width: MediaQuery.of(context).size.width * 0.6,
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  Future<List<String>> getFollowedUserIDs(String userId) async {
    try {
      // Query Firestore to get the list of followed user IDs
      var snapshot = await FirebaseFirestore.instance
          .collection('members')
          .doc(userId)
          .get();

      // Extract the list of followed user IDs
      List<dynamic> following = snapshot.data()?['following'];

      // Filter out the caller ID
      following.removeWhere((id) => id == userId);

      // Return the remaining user IDs
      return following.cast<String>();
    } catch (e) {
      print("Error getting followed users: $e");
      return [];
    }
  }

  Future<List<String>> getUserNames(List<String> userIds) async {
    List<String> userNames = [];
    try {
      // Query Firestore to get the names of users with the given IDs
      for (String userId in userIds) {
        var snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        // Extract the user name
        String userName = snapshot.data()?['name'];
        userNames.add(userName);
      }
      return userNames;
    } catch (e) {
      print("Error getting user names: $e");
      return [];
    }
  }

  Future<List<String>> getUserImages(List<String> userIds) async {
    List<String> userImageUrls = [];
    try {
      // Query Firestore to get the profile image URLs of users with the given IDs
      for (String userId in userIds) {
        var snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        // Extract the user image URL
        String userImageUrl = snapshot.data()?['profileImageUrl'];
        userImageUrls.add(userImageUrl);
      }
      return userImageUrls;
    } catch (e) {
      print("Error getting user images: $e");
      return [];
    }
  }
}
