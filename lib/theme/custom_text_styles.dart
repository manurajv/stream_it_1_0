import 'package:flutter/material.dart';
import 'package:stream_it_1_0/core/app_export.dart';

class CustomTextStyles {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: AppStyle.txtGilroySemiBold24,
    headlineMedium: AppStyle.txtGilroyBold20,
    headlineSmall: AppStyle.txtGilroySemiBold16,
    bodyLarge: AppStyle.txtGilroySemiBold18,
    // ...add other styles you need
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: AppStyle.txtGilroySemiBold24.copyWith(color: Colors.white70),
    headlineMedium: AppStyle.txtGilroyBold20.copyWith(color: Colors.white70),
    headlineSmall: AppStyle.txtGilroySemiBold16.copyWith(color: Colors.white70),
    bodyLarge: AppStyle.txtGilroySemiBold18.copyWith(color: Colors.white70),
    // ...add other styles you need
  );
}
