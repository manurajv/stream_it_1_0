import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:stream_it_1_0/presentation/facebook_feeds_display_screen/widgets/postData_item_widget.dart';
import 'package:stream_it_1_0/widgets/app_bar/appbar_image.dart';
import 'package:stream_it_1_0/widgets/app_bar/appbar_title.dart';
import 'package:stream_it_1_0/widgets/app_bar/custom_app_bar.dart';
import 'package:stream_it_1_0/widgets/custom_text_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:stream_it_1_0/core/constants/constants.dart';

class FacebookFeedsDisplayScreen extends StatefulWidget {

  @override
  _FacebookFeedsDisplayScreenState createState() => _FacebookFeedsDisplayScreenState();
}

class _FacebookFeedsDisplayScreenState extends State<FacebookFeedsDisplayScreen> {
  bool _isExpanded = false;
  bool _isUploading = false;
  String? _facebookName;
  XFile? _selectedImage;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializePostCount();
  }

  void _handleImageSelection() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  Future<void> _initializePostCount() async {
    int count = await getDocumentCount();
    setState(() {
    });
  }

  Future<int> getDocumentCount() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('posts').get();
    return querySnapshot.size;
  }

  void _handlePostSubmission() async { // Mark function as async
    String text = _textController.text.trim();

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }
    final uid = currentUser.uid;

    _facebookName = Constants.getFacebookName();

    setState(() {
      _isUploading = true;
    });
    // Upload images to Firestore Storage
    String? imageUrl;
    if (_selectedImage != null) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString() + ".jpg";
      Reference storageRef = FirebaseStorage.instance.ref().child('posts/$fileName');

      UploadTask uploadTask = storageRef.putFile(File(_selectedImage!.path));

      // Wait for the upload to complete
      await uploadTask.whenComplete(() => null);

      // Get the download URL of the uploaded image
      imageUrl = await storageRef.getDownloadURL();
    }

    // Create a Firestore document to store post data
    if (text.isNotEmpty || imageUrl!.isNotEmpty) { // Only create if post has content
      await FirebaseFirestore.instance.collection('posts').add({
        'uid': uid,
        'name': _facebookName,
        'text': text,
        'imageUrl': imageUrl,
        'createdAt': Timestamp.now(),
      });
    }
    // Clear the text box and image selection
    setState(() {
      _textController.clear();
      _selectedImage = null;
      _isExpanded = false;
      _isUploading = false;
    });

    // Show "Posted" overlay
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      return Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(FluentIcons.checkmark_circle_24_regular, color: Colors.green, size: 50),
              SizedBox(height: 10),
              Text("Posted!", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      );
    });

    Overlay.of(context)?.insert(overlayEntry);

    // Remove overlay after a few seconds
    Future.delayed(Duration(seconds: 2), () => overlayEntry?.remove());
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorConstant.gray50,
        appBar: CustomAppBar(
          height: getVerticalSize(51),
          leadingWidth: 40,
          leading: AppbarImage(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            height: getSize(24),
            width: getSize(24),
            svgPath: ImageConstant.imgMenu24x24,
            margin: getMargin(left: 16, top: 13, bottom: 14),
          ),
          centerTitle: true,
          title: AppbarTitle(text: "StreamIT Feed"),
        ),
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Drawer(
            child: AppNavigationScreen(),
          ),
        ),
        body: Stack(
            children: [
              Padding(
              padding: getPadding(left: 16, top: 22, right: 16),
              child: Column(
                children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isExpanded = true;
                                });
                              },
                              child: Container(
                                height: _isExpanded ? 100 : 40,
                                child: CustomTextFormField(
                                  controller: _textController,
                                  maxLines: _isExpanded ? 10 : 1,
                                  hintText: "What's on your mind?",
                                  shape: TextFormFieldShape.CircleBorder16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(FluentIcons.image_add_24_regular),
                            onPressed: _handleImageSelection,
                          ),
                          IconButton(
                            icon: Icon(FluentIcons.send_24_regular),
                            onPressed: _handlePostSubmission,
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('posts')
                            .orderBy('createdAt', descending: true)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              //separatorBuilder: (context, index) => SizedBox(height: 24),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                final postDoc = snapshot.data!.docs[index];
                                final postId = postDoc.id;
                                final postData = postDoc.data() as Map<String, dynamic>;
                                return PostDataItemWidget(postData: postData, postId: postId);
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            if (_isUploading)
              ModalProgressHUD(inAsyncCall: _isUploading,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

