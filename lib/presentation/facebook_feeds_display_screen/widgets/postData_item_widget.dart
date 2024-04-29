import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/widgets/custom_text_form_field.dart';
import 'package:stream_it_1_0/core/constants/constants.dart';
import 'package:stream_it_1_0/core/constants/push_notification_service.dart';

// ignore: must_be_immutable
class PostDataItemWidget extends StatefulWidget {
  final Map<String, dynamic> postData;
  final String postId;

  PostDataItemWidget({Key? key, required this.postData, required this.postId}) : super(key: key);

  @override
  State<PostDataItemWidget> createState() => _PostDataItemWidgetState();
}

class _PostDataItemWidgetState extends State<PostDataItemWidget> {

  DateTime currentTime = DateTime.now();
  bool _showOverlay = false;
  String? proPicUrl = Constants.getProPic();
  int? _likes;
  int? _comments;
  int? _shares;
  bool _isLiked = false;
  String? _postOwnerId;
  String? _token;
  bool _isDarkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _likes = widget.postData['likes'] ?? 0 ;
    _isLiked = widget.postData['likedBy']?.contains(FirebaseAuth.instance.currentUser!.uid) ?? false;
    FirebaseFirestore.instance.collection('posts').snapshots();
    _comments = widget.postData['comments'] ?? 0;
    _shares = widget.postData['shares'] ?? 0;
    _postOwnerId = widget.postData['uid'];
    _getPostOwnerToken(_postOwnerId!).then((token) {
      if (token != null) {
        setState(() {
          _token = token;
        });
      }
    });
    _loadDarkModeStatus();
  }

  Future<void> _loadDarkModeStatus() async {
    bool isDarkMode = await Constants.isDarkModeEnabled();
    setState(() {
      _isDarkModeEnabled = isDarkMode;
    });
  }

  Future<String?> _getPostOwnerToken(String ownerId) async {
    try {
      var tokenDoc = await FirebaseFirestore.instance.collection('user_tokens').doc(ownerId).get();
      if (tokenDoc.exists) {
        if (mounted) {
          setState(() {
            _token = tokenDoc.data()?['token'];
          });
        }
        return tokenDoc.data()?['token'];
      } else {
        print('Token not found for user with ID: $ownerId');
        return null;
      }
    } catch (e) {
      print('Error fetching token for user with ID: $ownerId\nError: $e');
      return null;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      //decoration: AppDecoration.outlineGray70011,
      child: Container(
        //decoration: AppDecoration.outlineGray70011,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: getPadding(left: 16, top: 16, right: 16, bottom: 16),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        //imagePath: ImageConstant.imgProfileimglarge46x46,
                        url: widget.postData['proPic'],
                        height: getSize(46),
                        width: getSize(46),
                        radius: BorderRadius.circular(getHorizontalSize(23)),
                      ),
                      Container(
                        width: getHorizontalSize(150),
                        margin: getMargin(
                          left: 16,
                          top: 4,
                          bottom: 2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            widget.postData.containsKey('name')
                                ? Text(
                              widget.postData['name'],
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                                : Text("Name Not Fetched"),
                            Padding(
                              padding: getPadding(
                                top: 5,
                              ),
                              child: widget.postData.containsKey('createdAt')
                                  ? Text(
                                _postCreatedTime(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtGilroyRegular12,
                              )
                                  : Text("Time Not Fetched"),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                        Row(
                          children: [
                            _buildOverlay(),
                            GestureDetector(
                              onTap: () {
                                // Handle tap event to show overlay
                                setState(() {
                                  _showOverlay = !_showOverlay;
                                });
                              },
                              child: CustomImageView(
                                svgPath: ImageConstant.imgArrowdownBlueGray400,
                                height: getSize(24),
                                width: getSize(24),
                                margin: getMargin(top: 11, bottom: 11),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
            CustomImageView(
              //imagePath: ImageConstant.imgGroup97071,
              url: widget.postData['imageUrl'].toString(),
              width: MediaQuery.sizeOf(context).width,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: getHorizontalSize(330),
                margin: getMargin(left: 6, top: 19, right: 49),
                child: widget.postData.containsKey('text')
                    ? Text(
                  widget.postData['text'],
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtGilroyMedium18,
                )
                    : Text("Content Not Fetched"),
              ),
            ),
            Padding(
              padding: getPadding(left: 43, top: 4, right: 41, bottom: 10),
                child: Container(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                    _likes.toString() + '  Likes',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtGilroyMedium12,
                    ),
                    Text(
                      _comments.toString() + '  Comments',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtGilroyMedium12,
                    ),
                    // Text(
                    //   _shares.toString() + '',
                    //   overflow: TextOverflow.ellipsis,
                    //   textAlign: TextAlign.left,
                    //   style: AppStyle.txtGilroyMedium12,
                    // ),
                    Container(
                      margin: getMargin(top: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(FluentIcons.comment_16_regular),
                            onPressed: () {
                              _showCommentDrawer();
                            },
                            color: _isDarkModeEnabled ? ColorConstant.blueA700 : ColorConstant.blueGray900,
                          ),
                          // Padding(
                          //   padding: getPadding(left: 8, top: 4, bottom: 4),
                          //   child: Text(
                          //     "Comment",
                          //     overflow: TextOverflow.ellipsis,
                          //     textAlign: TextAlign.left,
                          //     style: AppStyle.txtGilroyMedium12,
                          //   ),
                          // ),
                          //Spacer(flex: 10,),
                          IconButton(
                            icon: _isLiked ? Icon(FluentIcons.thumb_like_16_filled) : Icon(FluentIcons.thumb_like_16_regular),
                            onPressed: () {
                              _toggleLike();
                              //_sendPushMessage(_token!, "222222222222222222222222222222222222", "Notification5555555555555555555555555555555555");
                            },
                            color: _isDarkModeEnabled ? ColorConstant.blueA700 : ColorConstant.blueGray900,
                          ),
                          // Padding(
                          //   padding: getPadding(left: 8, top: 4, bottom: 4),
                          //   child: Text(
                          //     "Like",
                          //     overflow: TextOverflow.ellipsis,
                          //     textAlign: TextAlign.left,
                          //     style: AppStyle.txtGilroyMedium12,
                          //   ),
                          // ),
                          //Spacer(flex: 46),
                          // IconButton(
                          //   icon: Icon(FluentIcons.share_android_16_regular),
                          //   onPressed: () {
                          //   },
                          // ),
                          // Padding(
                          //   padding: getPadding(left: 8, top: 4, bottom: 4),
                          //   child: Text(
                          //     "Share",
                          //     overflow: TextOverflow.ellipsis,
                          //     textAlign: TextAlign.left,
                          //     style: AppStyle.txtGilroyMedium12,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //_buildOverlay(),
            Divider(thickness: 1.0,),
          ],
        ),
      ),
    );
  }

  Widget _buildOverlay() {

    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    bool isCurrentUserPost = widget.postData['uid'] == currentUserId;
    bool isAdmin = Constants.adminUId == currentUserId;

    return _showOverlay && (isCurrentUserPost || isAdmin)
        ? Positioned(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8),
            IconButton(
              icon: Icon(FluentIcons.edit_12_filled),
              onPressed: () {
                _editPostText();
              },
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(FluentIcons.delete_12_filled),
              onPressed: () {
                _deletePost();
              },
            ),
            SizedBox(width: 12),
          ],
        ),
      ),
    )
        : SizedBox(); // If _showOverlay is false, don't show the buttons
  }

  String _postCreatedTime() {
    DateTime createdAt = widget.postData['createdAt'].toDate();
    DateTime now = DateTime.now();
    Duration difference = now.difference(createdAt);
    String time;

    if (difference.inMinutes < 1) {
      time = 'just now';
    } else if (difference.inHours < 1) {
      time = '${difference.inMinutes} min ago';
    } else if (difference.inDays < 1) {
      time = '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 2) {
      time = '1 day ago';
    } else if (difference.inDays < 30) {
      time = '${difference.inDays} days ago';
    } else if (difference.inDays < 365) {
      int months = (difference.inDays / 30).floor();
      time = '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      int years = (difference.inDays / 365).floor();
      int remainingMonths = (difference.inDays % 365) ~/ 30;
      if (remainingMonths == 0) {
        time = '$years ${years == 1 ? 'year' : 'years'} ago';
      } else {
        time = '$years ${years == 1 ? 'year' : 'years'}, $remainingMonths ${remainingMonths == 1 ? 'month' : 'months'} ago';
      }
    }

    return time;
  }

  void _deletePost() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Deletion"),
          content: Text("Are you sure you want to delete this post?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                // Proceed with post deletion
                await _performPostDeletion();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _performPostDeletion() async {
    try {
      String postId = widget.postId;
      var postRef = FirebaseFirestore.instance.collection('posts').doc(postId);
      await postRef.delete();
      setState(() {
        _showOverlay = false;
      });

      OverlayEntry? overlayEntry;
      overlayEntry = OverlayEntry(builder: (context) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(FluentIcons.delete_dismiss_24_filled, color: Colors.red, size: 50),
                SizedBox(height: 10),
                Text("Deleted!", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        );
      });

      Overlay.of(context)?.insert(overlayEntry);

      // Remove overlay after a few seconds
      Future.delayed(Duration(seconds: 2), () => overlayEntry?.remove());

    } catch (e) {
      print("Error deleting post: $e");
      // Handle error
    }
  }

  void _editPostText() {
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = widget.postData['text'] ?? '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Post'),
          content: CustomTextFormField(
            controller: textEditingController,
            hintText: 'Enter new post text',
            maxLines: null,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Update the post text in Firestore
                _updatePostText(textEditingController.text);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _updatePostText(String newText) async {
    try {
      String postId = widget.postId;
      var postRef = FirebaseFirestore.instance.collection('posts').doc(postId);
      DateTime currentTime = DateTime.now();
      await postRef.update({
        'text': newText,
        'createdAt': currentTime,
      });

      OverlayEntry? overlayEntry;
      overlayEntry = OverlayEntry(builder: (context) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(FluentIcons.checkmark_circle_24_regular, color: Colors.green, size: 50),
                SizedBox(height: 10),
                Text("Updated!", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        );
      });

      Overlay.of(context)?.insert(overlayEntry);

      // Remove overlay after a few seconds
      Future.delayed(Duration(seconds: 2), () => overlayEntry?.remove());

    } catch (e) {
      print("Error updating post text: $e");
      // Handle error
    }
  }

  void _toggleLike() async {
    final facebookName = Constants.getFacebookName()?.toString() ?? 'Unknown';
    setState(() {
      // Toggle like status
      _isLiked = !_isLiked;
      // Increase or decrease likes count based on like status
      _likes = (_likes ?? 0) + (_isLiked ? 1 : -1);
    });

    try {
      String postId = widget.postId;
      var postRef = FirebaseFirestore.instance.collection('posts').doc(postId);
        // Update likes count and likedBy field on Firebase
        await postRef.update({
          'likes': _likes,
          'likedBy': _isLiked ? FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid]) : FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid])
        });
        _isLiked ? sendPushMessageWithoutAction(_token!, 'liked your post', facebookName) : print('DisLiked');
    } catch (e) {
        print("Error updating like: $e");
        // Handle error
      }
  }


  void _showCommentDrawer() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(top: 50, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('comments')
                      .where('postId', isEqualTo: widget.postId)
                      .orderBy('createdAt', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    var comments = snapshot.data?.docs ?? [];
                    return ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        var commentData = comments[index].data() as Map<String, dynamic>?;
                        var name = commentData?['name'] ?? '';
                        var text = commentData?['text'] ?? '';
                        var createdAt = commentData?['createdAt']?.toDate();
                        var now = DateTime.now();
                        var difference = now.difference(createdAt!);
                        var time = '';
                        if (difference.inMinutes < 1) {
                          time = 'just now';
                        } else if (difference.inHours < 1) {
                          time = '${difference.inMinutes} min ago';
                        } else if (difference.inDays < 1) {
                          time = '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
                        } else if (difference.inDays < 2) {
                          time = '1 day ago';
                        } else if (difference.inDays < 30) {
                          time = '${difference.inDays} days ago';
                        } else if (difference.inDays < 365) {
                          int months = (difference.inDays / 30).floor();
                          time = '$months ${months == 1 ? 'month' : 'months'} ago';
                        } else {
                          int years = (difference.inDays / 365).floor();
                          int remainingMonths = (difference.inDays % 365) ~/ 30;
                          if (remainingMonths == 0) {
                            time = '$years ${years == 1 ? 'year' : 'years'} ago';
                          } else {
                            time = '$years ${years == 1 ? 'year' : 'years'}, $remainingMonths ${remainingMonths == 1 ? 'month' : 'months'} ago';
                          }
                        }
                        var proPicUrl = commentData?['proPicUrl'] ?? '';
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(proPicUrl),
                          ),
                          title: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                time,
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              text,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: _commentController,
                        hintText: 'Add a comment...',
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        _addComment();
                      },
                      child: Text('Comment'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  TextEditingController _commentController = TextEditingController();

  void _addComment() async {
    String commentText = _commentController.text.trim();
    final comment = ' Commented on your post:\n' + (commentText ?? '');
    if (commentText.isNotEmpty) {
      try {
        String userId = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance.collection('comments').add({
          'postId': widget.postId,
          'user': userId, // Assuming you have a 'users' collection with user data
          'name': Constants.getFacebookName(),
          'text': commentText,
          'createdAt': DateTime.now(),
          'proPicUrl': proPicUrl,
        });

        var postRef = FirebaseFirestore.instance.collection('posts').doc(widget.postId);
        await postRef.update({
          'comments': FieldValue.increment(1), // Increment the comments count
        });

        sendPushMessageWithoutAction(_token!,comment, Constants.getFacebookName().toString());

        setState(() {
          _comments = (_comments ?? 0) + 1;
        });

        _commentController.clear();
      } catch (e) {
        print("Error adding comment: $e");
        // Handle error
      }
    }
  }

}

