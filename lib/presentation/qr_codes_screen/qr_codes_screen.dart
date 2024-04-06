import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/widgets/app_bar/appbar_image.dart';
import 'package:stream_it_1_0/widgets/app_bar/appbar_title.dart';
import 'package:stream_it_1_0/widgets/app_bar/custom_app_bar.dart';
import 'package:stream_it_1_0/widgets/custom_button.dart';

class QrCodesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(49),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 13, bottom: 12),
                    onTap: () {
                      onTapArrowleft1(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "QR code")),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, right: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgImage79,
                          height: getSize(200),
                          width: getSize(200),
                          margin: getMargin(top: 33)),
                      Padding(
                          padding: getPadding(top: 31),
                          child: Text("Lorem ipsum",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroySemiBold24)),
                      Container(
                          width: getHorizontalSize(373),
                          margin: getMargin(left: 11, top: 13, right: 11),
                          child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Massa sociis quam nascetur felis in enim. Praesent id vel nisi, adipiscing scelerisque.",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtGilroyMedium16Bluegray400)),
                      Spacer(),
                      CustomButton(
                          height: getVerticalSize(50),
                          text: "Copy Code",
                          padding: ButtonPadding.PaddingAll14,
                          fontStyle: ButtonFontStyle.GilroyMedium16)
                    ]))));
  }

  onTapArrowleft1(BuildContext context) {
    Navigator.pop(context);
  }
}
