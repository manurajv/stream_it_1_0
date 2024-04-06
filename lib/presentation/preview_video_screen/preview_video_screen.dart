import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/widgets/app_bar/appbar_image.dart';
import 'package:stream_it_1_0/widgets/app_bar/custom_app_bar.dart';
import 'package:stream_it_1_0/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class PreviewVideoScreen extends StatelessWidget {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(650),
                          width: double.maxFinite,
                          child: Stack(alignment: Alignment.center, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRectangle1227,
                                height: getVerticalSize(650),
                                width: getHorizontalSize(428),
                                alignment: Alignment.center),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    padding: getPadding(top: 8, bottom: 8),
                                    decoration: AppDecoration.fillBlack9007f,
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomAppBar(
                                              height: getVerticalSize(29),
                                              leadingWidth: 40,
                                              leading: AppbarImage(
                                                  height: getSize(24),
                                                  width: getSize(24),
                                                  svgPath: ImageConstant
                                                      .imgArrowleftWhiteA700,
                                                  margin: getMargin(left: 16),
                                                  onTap: () {
                                                    onTapArrowleft2(context);
                                                  }),
                                              actions: [
                                                AppbarImage(
                                                    height: getSize(24),
                                                    width: getSize(24),
                                                    svgPath: ImageConstant
                                                        .imgVolume24x24,
                                                    margin: getMargin(
                                                        left: 16, right: 16))
                                              ]),
                                          Spacer(),
                                          Padding(
                                              padding: getPadding(
                                                  left: 16, right: 16),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(
                                                            top: 5, bottom: 6),
                                                        child: Text("01:40",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtGilroyMedium10)),
                                                    Container(
                                                        height:
                                                            getVerticalSize(3),
                                                        width:
                                                            getHorizontalSize(
                                                                301),
                                                        margin: getMargin(
                                                            left: 5,
                                                            top: 11,
                                                            bottom: 10),
                                                        child: Stack(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            children: [
                                                              Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: SizedBox(
                                                                      width: getHorizontalSize(
                                                                          301),
                                                                      child: Divider(
                                                                          height: getVerticalSize(
                                                                              3),
                                                                          thickness: getVerticalSize(
                                                                              3),
                                                                          color:
                                                                              ColorConstant.gray400))),
                                                              Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: SizedBox(
                                                                      width: getHorizontalSize(
                                                                          231),
                                                                      child: Divider(
                                                                          height: getVerticalSize(
                                                                              3),
                                                                          thickness: getVerticalSize(
                                                                              3),
                                                                          color:
                                                                              ColorConstant.amber500)))
                                                            ])),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 4,
                                                            top: 5,
                                                            bottom: 6),
                                                        child: Text("2:00",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtGilroyMedium10)),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgMinimize,
                                                        height: getSize(24),
                                                        width: getSize(24),
                                                        margin:
                                                            getMargin(left: 16))
                                                  ]))
                                        ])))
                          ])),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 16, top: 16, right: 16),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: getHorizontalSize(323),
                                        margin: getMargin(top: 3),
                                        child: Text(
                                            "Web ReDesign Challenge In Adobe XD, Figma and Sketch",
                                            maxLines: null,
                                            textAlign: TextAlign.left,
                                            style:
                                                AppStyle.txtGilroySemiBold18)),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgArrowdown,
                                        height: getSize(24),
                                        width: getSize(24),
                                        margin: getMargin(left: 48, bottom: 34))
                                  ]))),
                      Padding(
                          padding: getPadding(left: 16, top: 10, bottom: 5),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(bottom: 1),
                                    child: Text("1k View",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtGilroyMedium14)),
                                Container(
                                    height: getSize(4),
                                    width: getSize(4),
                                    margin:
                                        getMargin(left: 8, top: 6, bottom: 8),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.blueGray400,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(2)))),
                                Padding(
                                    padding: getPadding(left: 8, top: 1),
                                    child: Text("2 day ago",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtGilroyMedium14))
                              ]))
                    ])),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {})));
  }

  onTapArrowleft2(BuildContext context) {
    Navigator.pop(context);
  }
}
