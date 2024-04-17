import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/widgets/custom_button.dart';

class FollowersItemWidget extends StatefulWidget {
  final Map<String, dynamic> usersData;

  FollowersItemWidget({Key? key, required this.usersData}) : super(key: key);

  @override
  State<FollowersItemWidget> createState() => _FollowersItemWidget();
}

class _FollowersItemWidget extends State<FollowersItemWidget> {

  @override
  void initState() {
    super.initState();
    print(widget.usersData['profileImageUrl']);
    print(Constants.getUId());
    print(widget.usersData['uid']);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          url: widget.usersData['profileImageUrl'].toString(),
          height: getSize(50),
          width: getSize(50),
          radius: BorderRadius.circular(getHorizontalSize(25)),
        ),
        Container(
          width: getHorizontalSize(150),
          margin: getMargin(left: 16, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.usersData['name'],
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtGilroySemiBold18,
              ),
              Padding(
                padding: getPadding(top: 5),
                child: Text(
                  "new user",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtGilroyRegular14,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Constants.getUId() == widget.usersData['uid']
            ? Text("Your profile", style: TextStyle(color: Colors.grey))
            : CustomButton(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Follow User"),
                  content: Text("You are following User Name"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK"),
                    ),
                  ],
                );
              },
            );
          },
          height: getVerticalSize(34),
          width: getHorizontalSize(65),
          text: "Follow",
          margin: getMargin(top: 7, bottom: 8),
        ),
      ],
    );
  }
}
