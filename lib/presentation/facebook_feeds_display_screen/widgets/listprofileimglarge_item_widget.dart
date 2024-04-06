import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';

// ignore: must_be_immutable
class ListprofileimglargeItemWidget extends StatelessWidget {
  ListprofileimglargeItemWidget();

  DateTime currentTime = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Container(
        decoration: AppDecoration.outlineGray70011,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: getPadding(
                left: 16,
                top: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgProfileimglarge46x46,
                    height: getSize(
                      46,
                    ),
                    width: getSize(
                      46,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        23,
                      ),
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      99,
                    ),
                    margin: getMargin(
                      left: 16,
                      top: 4,
                      bottom: 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Post Heading",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtGilroySemiBold16,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 5,
                          ),
                          child: Text(
                            "Time $currentTime",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtGilroyRegular12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    svgPath: ImageConstant.imgArrowdownBlueGray400,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                    margin: getMargin(
                      top: 11,
                      bottom: 11,
                    ),
                  ),
                ],
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgGroup97071,
              height: getSize(150),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: getHorizontalSize(
                  330,
                ),
                margin: getMargin(
                  left: 16,
                  top: 19,
                  right: 49,
                ),
                child: Text(
                  "This is the content of a post",
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtGilroyMedium18,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 43,
                top: 18,
                right: 41,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "109 Likes",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroyMedium12,
                  ),
                  Text(
                    "03 Comment",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroyMedium12,
                  ),
                  Text(
                    "2 Share",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroyMedium12,
                  ),
                ],
              ),
            ),
            Container(
              margin: getMargin(
                top: 10,
              ),
              padding: getPadding(
                left: 34,
                top: 8,
                right: 34,
                bottom: 8,
              ),
              decoration: AppDecoration.outlineBluegray1001,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgThumbsup,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                    margin: getMargin(
                      left: 6,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 8,
                      top: 4,
                      bottom: 4,
                    ),
                    child: Text(
                      "Like",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtGilroyMedium12,
                    ),
                  ),
                  Spacer(
                    flex: 53,
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgVolume,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 8,
                      top: 4,
                      bottom: 4,
                    ),
                    child: Text(
                      "Comment",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtGilroyMedium12,
                    ),
                  ),
                  Spacer(
                    flex: 46,
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgReply,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 8,
                      top: 4,
                      bottom: 4,
                    ),
                    child: Text(
                      "Share",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtGilroyMedium12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
