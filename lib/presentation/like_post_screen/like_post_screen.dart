import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/widgets/app_bar/appbar_image.dart';
import 'package:stream_it_1_0/widgets/app_bar/custom_app_bar.dart';

class LikePostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 16,
            top: 24,
            right: 16,
            bottom: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                child: Container(
                  width: getHorizontalSize(
                    396,
                  ),
                  decoration: AppDecoration.outlineGray70011,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomAppBar(
                        height: getVerticalSize(
                          62,
                        ),
                        leadingWidth: 78,
                        leading: CustomImageView(
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
                          margin: getMargin(
                            left: 32,
                          ),
                        ),
                        title: Padding(
                          padding: getPadding(
                            left: 16,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Rose J. Henry",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroySemiBold16,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: getPadding(
                                    top: 5,
                                    right: 25,
                                  ),
                                  child: Text(
                                    "7 May at 19:18",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtGilroyRegular12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          AppbarImage(
                            height: getSize(
                              24,
                            ),
                            width: getSize(
                              24,
                            ),
                            svgPath: ImageConstant.imgArrowdownBlueGray400,
                            margin: getMargin(
                              left: 32,
                              top: 11,
                              right: 32,
                              bottom: 11,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: getHorizontalSize(
                          330,
                        ),
                        margin: getMargin(
                          left: 16,
                          top: 19,
                          right: 49,
                        ),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictum ipsum venenatis sagittis, a sapien, magna lorem vitae. Pretium, risus nisl mi molestie adipiscing.",
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtGilroyMedium18,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
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
                              svgPath: ImageConstant.imgThumbsup24x24,
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
                                style: AppStyle.txtGilroyMedium12BlueA700,
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
              ),
              Container(
                width: double.maxFinite,
                child: Container(
                  margin: getMargin(
                    top: 24,
                    bottom: 5,
                  ),
                  decoration: AppDecoration.outlineGray70011,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: getPadding(
                          left: 16,
                          top: 17,
                          right: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgProfileimglarge21,
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
                                93,
                              ),
                              margin: getMargin(
                                left: 16,
                                top: 2,
                                bottom: 2,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Danial Sams",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtGilroySemiBold16,
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 7,
                                    ),
                                    child: Text(
                                      "1 May at 10:32",
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
                        height: getVerticalSize(
                          298,
                        ),
                        width: getHorizontalSize(
                          396,
                        ),
                        margin: getMargin(
                          top: 16,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 43,
                          top: 10,
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
                              svgPath: ImageConstant.imgThumbsup1,
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
                                style: AppStyle.txtGilroyMedium12BlueA700,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
