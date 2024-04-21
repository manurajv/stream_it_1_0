import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../stream_setup_screen/stream_setup_screen.dart';

class StartStreamingScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690));
    return Scaffold(
      appBar: CustomAppBar(
        height: getVerticalSize(51),
        leadingWidth: 40,
        centerTitle: true,
        title: AppbarTitle(text: "Stream it Start Stream"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.network(
                  //   'https://img.freepik.com/free-vector/realistic-front-view-smartphone-mockup-mobile-iphone-purple-frame-with-blank-white-display-vector_90220-959.jpg?size=338&ext=jpg&ga=GA1.1.1700460183.1708300800&semt=ais',
                  //   scale: 3,
                  // ),
                  SizedBox(width: 20.w),
                  _buildStartButton(
                    icon: FluentIcons.screenshot_record_28_filled,
                    title: 'Start Live with Screen',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StreamSetupScreen()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.network(
                  //   'https://img.freepik.com/free-vector/realistic-front-view-smartphone-mockup-mobile-iphone-purple-frame-with-blank-white-display-vector_90220-959.jpg?size=338&ext=jpg&ga=GA1.1.1700460183.1708300800&semt=ais',
                  //   scale: 3,
                  // ),
                  SizedBox(width: 20.w),
                  _buildStartButton(
                    icon: FluentIcons.camera_28_filled,
                    title: 'Start Live with Camera',
                    onPressed: () {
                      //Navigator.pushNamed(context, AppRoutes.liveStreamingScreen);
                      Navigator.pushNamed(context, AppRoutes.cameraLiveViewPage);
                    }, // Implement camera functionality
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStartButton({
    required IconData icon,
    required String title,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(150.w, 50.h),
      ),
      onPressed: onPressed,
      icon: FaIcon(icon, size: 30),
      label: Text(title),
    );
  }
}
