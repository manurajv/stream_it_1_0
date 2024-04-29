import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/widgets/custom_button.dart';

class FollowersItemWidget extends StatefulWidget {
  final Map<String, dynamic> usersData;

  FollowersItemWidget({Key? key, required this.usersData}) : super(key: key);

  @override
  State<FollowersItemWidget> createState() => _FollowersItemWidgetState();
}

class _FollowersItemWidgetState extends State<FollowersItemWidget> {
  bool _isFollowing = false;
  DateTime? _userCreationDate;

  @override
  void initState() {
    super.initState();
    _checkIfFollowing();
    //_getUserCreationDate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkIfFollowing(); // Call _checkIfFollowing() here
  }

  Future<void> _checkIfFollowing() async {
    try {
      String? currentUserId = FirebaseAuth.instance.currentUser?.uid;
      if (currentUserId != null) {
        String followedUserId = widget.usersData['uid'];
        var userRef = FirebaseFirestore.instance.collection('members').doc(currentUserId);
        var userDoc = await userRef.get();
        if (userDoc.exists) {
          var userData = userDoc.data();
          List<dynamic> following = userData?['following'] ?? [];
          setState(() {
            _isFollowing = following.contains(followedUserId);
          });
        }
      }
    } catch (e) {
      print("Error checking if following: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomImageView(
        url: widget.usersData['profileImageUrl'].toString(),
        radius: BorderRadius.circular(getHorizontalSize(50)),
        ),
      title: Text(widget.usersData['name'], style: Theme.of(context).textTheme.headlineSmall,),
      subtitle: _userCreationDate != null
          ? Text("Joined: ${DateFormat('yy-MM-dd').format(_userCreationDate!)}")
          : null,
      trailing: _buildFollowButton(),
    );
  }

  Widget _buildFollowButton() {
    if (Constants.getUId() == widget.usersData['uid']) {
      return Text("Your profile", style: TextStyle(color: Colors.grey));
    } else {
      return CustomButton(
        onTap: _toggleFollow,
        height: getVerticalSize(34),
        width: getHorizontalSize(65),
        text: _isFollowing ? "Unfollow" : "Follow",
        variant: _isFollowing ? ButtonVariant.FillBlack9007f : ButtonVariant.FillBlueA700,
        margin: getMargin(top: 7, bottom: 8),
      );
    }
  }

  // Future<void> _getUserCreationDate() async {
  //   try {
  //     User? user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       await user.reload(); // Refresh the user data to get the latest metadata
  //       UserMetadata metadata = user.metadata;
  //       DateTime creationDate = metadata.creationTime ?? DateTime.now(); // Use current time if creation time is not available
  //       setState(() {
  //         _userCreationDate = creationDate;
  //       });
  //     }
  //   } catch (e) {
  //     print("Error fetching user creation date: $e");
  //   }
  // }

  void _toggleFollow() async {
    setState(() {
      _isFollowing = !_isFollowing;
    });

    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      String followedUserId = widget.usersData['uid'];
      var userRef = FirebaseFirestore.instance.collection('members').doc(userId);
      var followedUserRef = FirebaseFirestore.instance.collection('members').doc(followedUserId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        if (_isFollowing) {
          await followedUserRef.update({
            'followers': FieldValue.arrayUnion([userId]),
          });
          await userRef.update({
            'following': FieldValue.arrayUnion([followedUserId]),
          });
        } else {
          await followedUserRef.update({
            'followers': FieldValue.arrayRemove([userId]),
          });
          await userRef.update({
            'following': FieldValue.arrayRemove([followedUserId]),
          });
        }
      });

      // Show alert dialog
      _showFollowConfirmationDialog(widget.usersData['name'], _isFollowing);
    } catch (e) {
      print("Error toggling follow status: $e");
    }
  }

  void _showFollowConfirmationDialog(String userName, bool isFollowing) {
    String action = isFollowing ? 'Follow' : 'Unfollow';
    String confirmationMessage = isFollowing ? 'You are now following $userName' : 'You have unfollowed $userName';
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // Show dialog with opacity
        return Dialog(
          backgroundColor: Colors.black.withOpacity(0.2), // Set opacity here
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "$action User",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  confirmationMessage,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    // Close dialog after 1 second
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }

}
