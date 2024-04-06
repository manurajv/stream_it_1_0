import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_box_transform/flutter_box_transform.dart';
import '../streaming_screen/widget/customized_screen_values.dart';

class StreamCustomizationScreen extends StatefulWidget {
  final String selectedOrientation;

  const StreamCustomizationScreen({
    Key? key,
    required this.selectedOrientation,
  }) : super(key: key);

  @override
  State<StreamCustomizationScreen> createState() => _StreamCustomizationScreenState();
}

class _StreamCustomizationScreenState extends State<StreamCustomizationScreen> {
  double mediaPreviewWidth = ScreenUtil().screenWidth;
  double mediaPreviewHeight = ScreenUtil().screenHeight * 0.75;
  double chatPreviewWidth = ScreenUtil().screenWidth * 0.5;
  double chatPreviewHeight = ScreenUtil().screenHeight * 0.5;
  double chatPreviewLeft = 0;
  double chatPreviewTop = 0;
  double chatPreviewRight = 0;
  double chatPreviewBottom = 0;

  bool useLiveChat = true;
  String selectedPicturePath = '';
  Widget pictureWidget = Container();
  bool showChatPreview = false;
  bool showImagePreview = false;

  CustomizedScreenValues updatedValues = CustomizedScreenValues(
    mediaPreviewHeight: 0,
    mediaPreviewWidth: 0,
    rectChatBottom: 0,
    rectChatLeft: 0,
    rectChatRight: 0,
    rectChatTop: 0,
    rectImageBottom: 0,
    rectImageLeft: 0,
    rectImageRight: 0,
    rectImageTop: 0,
    selectedPicturePath: '',
    showChatPreview: false,
    showImagePreview: false,
  );



  void onChatReplacementSelected(bool useLiveChat) {
    setState(() {
      this.useLiveChat = useLiveChat;
    });
  }

  late Rect rectChat = Rect.fromCenter(
    center: MediaQuery.of(context).size.center(Offset.zero),
    width: mediaPreviewWidth/2,
    height: mediaPreviewHeight/2,
  );

  late Rect rectImage = Rect.fromCenter(
    center: MediaQuery.of(context).size.center(Offset.zero),
    width: mediaPreviewWidth/2,
    height: mediaPreviewHeight/2,
  );

  late Container chatPreviewContainer = Container(
    width: rectChat.width,
    height: rectChat.height,
    decoration: BoxDecoration(
      color: Colors.transparent, // Make background transparent
      border: Border.all(color: Colors.black, width: 2), // Optional border
    ),
    child: ListView(// Use ListView to display comments
      children: [
        // Add your comments here
        ListTile(
          title: Text('Comment 1'),
          subtitle: Text('Author 1'),
        ),
        ListTile(
          title: Text('Comment 2'),
          subtitle: Text('Author 2'),
        ),
        // ... more comments
      ],
    ),
  );

  late Container imagePreviewContainer = Container(
    width: rectImage.width,
    height: rectImage.height,
    decoration: BoxDecoration(
      //color: Colors.transparent, // Make background transparent
      border: Border.all(color: Colors.black, width: 2), // Optional border
    ),
    //child: selectPicture;
  );

  Future<void> selectPicture() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedPicturePath = pickedImage.path;
        showImagePreview = true;
        imagePreviewContainer = Container(
          width: rectImage.width,
          height: rectImage.height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Image.file(File(selectedPicturePath), fit: BoxFit.cover),
        );
      });
    }
  }


  void addChatPreview() {
    setState(() {
      showChatPreview = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedOrientation = widget.selectedOrientation;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: OrientationBuilder(
            builder: (context, orientation) {
              if (selectedOrientation == 'Portrait') {
                return Stack(
                  children: [
                    buildMediaPreviewPortrait(),
                    if (showChatPreview) buildChatPreview(context),
                    if (showImagePreview) buildImagePreview(context),

                  ],
                );
              } else {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                ]);
                return Stack(
                  children: [
                    buildMediaPreviewLandscape(),
                    if (showChatPreview) buildChatPreview(context),
                    if (showImagePreview) buildImagePreview(context),

                  ],
                );
              }
            },
          ),
        ),
        floatingActionButton: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: FloatingActionButton(
                heroTag: 'optionsFloatingButton',
                onPressed: () async {
                  final selectedOption = await showMenu<int>(
                    context: context,
                    position: RelativeRect.fromLTRB(2.0, kToolbarHeight + 40, 2.0, 0.0),
                    items: [
                      PopupMenuItem<int>(
                        value: 1,
                        child: Text("Add Chat preview"),
                      ),
                      PopupMenuItem<int>(
                        value: 2,
                        child: Text("Add Image"),
                      ),
                      PopupMenuItem<int>(
                        value: 3,
                        child: Text("Option 3"),
                      ),
                    ],
                  );

                  if (selectedOption != null) {
                    switch (selectedOption) {
                      case 1:
                        addChatPreview();
                        break;
                      case 2:
                        selectPicture();
                        // Handle Option 2
                        break;
                      case 3:
                      // Handle Option 3
                        break;
                    }
                  }
                },
                child: const Icon(Icons.more_vert),
              ),
            ),
            Positioned(
              bottom: ScreenUtil().setHeight(55),
              right: ScreenUtil().setWidth(15),
              child: FloatingActionButton(
                heroTag: 'saveFloatingButton',
                onPressed: () {
                  updatedValues.mediaPreviewHeight = mediaPreviewHeight;
                  updatedValues.mediaPreviewWidth = mediaPreviewWidth;
                  updatedValues.rectChatBottom = rectChat.bottom;
                  updatedValues.rectChatLeft = rectChat.left;
                  updatedValues.rectChatRight = rectChat.right;
                  updatedValues.rectChatTop = rectChat.top;
                  updatedValues.rectImageBottom = rectImage.bottom;
                  updatedValues.rectImageLeft = rectImage.left;
                  updatedValues.rectImageRight = rectImage.right;
                  updatedValues.rectImageTop = rectImage.top;
                  updatedValues.selectedPicturePath = selectedPicturePath;
                  updatedValues.showChatPreview = showChatPreview;
                  updatedValues.showImagePreview = showImagePreview;
                  print({'Chat Top :', rectChat.top});
                  print({'Chat Bottom :', rectChat.bottom});
                  print({'Chat Left :', rectChat.left});
                  print({'Chat Right :', rectChat.right});
                  print({'Image Top :', rectImage.top});
                  print({'Image Bottom :', rectImage.bottom});
                  print({'Image Left :', rectImage.left});
                  print({'Image Right :', rectImage.right});
                  print({'Height :', chatPreviewHeight});
                  print({'Width :', chatPreviewWidth});

                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                  ]);
                  Navigator.pop(context);
                },
                child: const Icon(FontAwesomeIcons.check),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      ),
    );
  }

  Widget buildMediaPreviewPortrait(){
    return Draggable(
      child: Container(
        width: mediaPreviewWidth,
        height: mediaPreviewHeight,
        color: Colors.grey[200],
        child: Center(child: Text('Media Preview')),
      ),
      feedback: Opacity(
        opacity: 0.2,
        child: Container(
          width: mediaPreviewWidth,
          height: mediaPreviewHeight,
          color: Colors.grey[200],
        ),
      ),
      onDragUpdate: onMediaPreviewResize,
    );
  }

  Widget buildMediaPreviewLandscape(){
    return Draggable(
      child: Container(
        width: mediaPreviewWidth,
        height: mediaPreviewHeight,
        color: Colors.blue[200],
        child: Center(child: Text('Media Preview')),
      ),
      feedback: Opacity(
        opacity: 0.2,
        child: Container(
          width: mediaPreviewWidth,
          height: mediaPreviewHeight,
          color: Colors.blue[200],
        ),
      ),
      onDragUpdate: onMediaPreviewResize,
    );
  }

  void onMediaPreviewResize(DragUpdateDetails details) {
    final newWidth = mediaPreviewWidth + details.delta.dx;
    final newHeight = mediaPreviewHeight + details.delta.dy;

    // Limit movement within available space (adjust as needed)
    final minWidth = 200.w;
    final minHeight = 300.h;
    final maxWidth = ScreenUtil().screenWidth;
    final maxHeight = ScreenUtil().screenHeight ;

    setState(() {
      mediaPreviewWidth = newWidth.clamp(minWidth, maxWidth);
      mediaPreviewHeight = newHeight.clamp(minHeight, maxHeight);
    });
  }

  Widget buildChatPreview(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        children: [
          TransformableBox(
            rect: rectChat,
            clampingRect: Offset.zero & MediaQuery.sizeOf(context),
            onChanged: (result, event) {
              setState(() {
                rectChat = result.rect;
              });
            },
            contentBuilder: (BuildContext context, Rect rectChat, Flip flip) {
              return chatPreviewContainer;
            },
          ),
        ]
    );
  }

  Widget buildImagePreview(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        children: [
          TransformableBox(
            rect: rectImage,
            clampingRect: Offset.zero & MediaQuery.sizeOf(context),
            onChanged: (result, event) {
              setState(() {
                rectImage = result.rect;
              });
            },
            contentBuilder: (BuildContext context, Rect rectImage, Flip flip) {
              return imagePreviewContainer;
            },
          ),
        ]
    );
  }

}
