import 'package:stream_it_1_0/presentation/app_navigation_screen/app_navigation_screen.dart';

import '../facebook_feeds_display_screen/widgets/listprofileimglarge_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';
import 'package:stream_it_1_0/widgets/app_bar/appbar_image.dart';
import 'package:stream_it_1_0/widgets/app_bar/appbar_title.dart';
import 'package:stream_it_1_0/widgets/app_bar/custom_app_bar.dart';
import 'package:stream_it_1_0/routes/app_routes.dart';

class FacebookFeedsDisplayScreen extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorConstant.gray50,
        appBar: CustomAppBar(
          height: getVerticalSize(
            51,
          ),
          leadingWidth: 40,
          leading: AppbarImage(
            onTap: (){
              //Navigation menu
              _scaffoldKey.currentState?.openDrawer();
            },
            height: getSize(
              24,
            ),
            width: getSize(
              24,
            ),
            svgPath: ImageConstant.imgMenu24x24,
            margin: getMargin(
              left: 16,
              top: 13,
              bottom: 14,
            ),
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "StreamIT Feed",
          ),
        ),
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75, // 75% of screen width
          child: Drawer(
            child: AppNavigationScreen(),
          ),
        ),
        body: Padding(
          padding: getPadding(
            left: 16,
            top: 22,
            right: 16,
          ),
          child: ListView.separated(
            //physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: getVerticalSize(
                  24,
                ),
              );
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListprofileimglargeItemWidget();
            },
          ),
        ),
      ),
    );
  }
}
