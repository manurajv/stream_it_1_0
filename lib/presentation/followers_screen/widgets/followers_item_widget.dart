import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/widgets/custom_button.dart';

// ignore: must_be_immutable
class FollowersItemWidget extends StatelessWidget {
  FollowersItemWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.img8148x48,
          height: getSize(
            50,
          ),
          width: getSize(
            50,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              25,
            ),
          ),
        ),
        Container(
          width: getHorizontalSize(
            112,
          ),
          margin: getMargin(
            left: 16,
            top: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Suggested User",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtGilroySemiBold18,
              ),
              Padding(
                padding: getPadding(
                  top: 5,
                ),
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
        CustomButton(
          onTap: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog( // Example Dialog
                  title: Text("Follow User"),
                  content: Text("You are following User Name"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Your confirmation logic here
                        Navigator.pop(context); // Close dialog
                      },
                      child: Text("OK"),
                    ),
                  ],
                );
              },
            );
          },
          height: getVerticalSize(
            34,
          ),
          width: getHorizontalSize(
            65,
          ),
          text: "Follow",
          margin: getMargin(
            top: 7,
            bottom: 8,
          ),
        ),
      ],
    );
  }

}
