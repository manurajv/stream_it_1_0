import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class ReviewPromptDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(
        330,
      ),
      padding: getPadding(
        left: 16,
        top: 24,
        right: 16,
        bottom: 24,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: getPadding(
              top: 5,
            ),
            child: Text(
              "Write your Review",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtGilroySemiBold18,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 13,
            ),
            child: Text(
              "Are you satisfied with the service?",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtGilroyMedium14,
            ),
          ),
          CustomImageView(
            svgPath: ImageConstant.imgFrame9844,
            height: getVerticalSize(
              32,
            ),
            width: getHorizontalSize(
              224,
            ),
            margin: getMargin(
              top: 25,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    height: getVerticalSize(
                      50,
                    ),
                    text: "Not Now",
                    margin: getMargin(
                      right: 4,
                    ),
                    variant: ButtonVariant.OutlineBlueA700,
                    padding: ButtonPadding.PaddingAll14,
                    fontStyle: ButtonFontStyle.GilroyMedium16BlueA700,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    height: getVerticalSize(
                      50,
                    ),
                    text: "Submit",
                    margin: getMargin(
                      left: 4,
                    ),
                    padding: ButtonPadding.PaddingAll14,
                    fontStyle: ButtonFontStyle.GilroyMedium16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
