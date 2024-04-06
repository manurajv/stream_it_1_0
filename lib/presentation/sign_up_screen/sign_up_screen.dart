import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/widgets/app_bar/appbar_image.dart';
import 'package:stream_it_1_0/widgets/app_bar/appbar_title.dart';
import 'package:stream_it_1_0/widgets/app_bar/custom_app_bar.dart';
import 'package:stream_it_1_0/widgets/custom_button.dart';
import 'package:stream_it_1_0/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatelessWidget {
  TextEditingController group10198Controller = TextEditingController();

  TextEditingController group10198OneController = TextEditingController();

  TextEditingController group10198TwoController = TextEditingController();

  TextEditingController group10198ThreeController = TextEditingController();

  TextEditingController group10198FourController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(42),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, bottom: 4),
                    onTap: () {
                      onTapArrowleft4(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "Sign Up")),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 16, top: 36, right: 16, bottom: 36),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Create Your Account",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroyBold24),
                          Padding(
                              padding: getPadding(top: 31),
                              child: Text("First Name",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtGilroyMedium16Bluegray900)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: group10198Controller,
                              hintText: "Enter First Name",
                              margin: getMargin(top: 8)),
                          Padding(
                              padding: getPadding(top: 19),
                              child: Text("Last Name",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtGilroyMedium16Bluegray900)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: group10198OneController,
                              hintText: "Enter Last Name",
                              margin: getMargin(top: 7)),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("Email Id",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtGilroyMedium16Bluegray900)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: group10198TwoController,
                              hintText: "Enter Email Id",
                              margin: getMargin(top: 8),
                              textInputType: TextInputType.emailAddress),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("Mobile Number",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtGilroyMedium16Bluegray900)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: group10198ThreeController,
                              hintText: "Enter Mobile Number",
                              margin: getMargin(top: 8),
                              textInputType: TextInputType.phone),
                          Padding(
                              padding: getPadding(top: 19),
                              child: Text("Password",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtGilroyMedium16Bluegray900)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: group10198FourController,
                              hintText: "Enter Password",
                              margin: getMargin(top: 7),
                              padding: TextFormFieldPadding.PaddingT12,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: Container(
                                  margin: getMargin(all: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgEye)),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(44)),
                              isObscureText: true),
                          CustomButton(
                              height: getVerticalSize(50),
                              text: "Create Account",
                              margin: getMargin(top: 24, bottom: 5),
                              padding: ButtonPadding.PaddingAll14,
                              fontStyle: ButtonFontStyle.GilroyMedium16)
                        ])))));
  }

  onTapArrowleft4(BuildContext context) {
    Navigator.pop(context);
  }
}
