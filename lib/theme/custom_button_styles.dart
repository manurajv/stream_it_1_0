import 'package:flutter/material.dart';

class CustomButtonStyles {
  static ButtonThemeData lightButtonTheme = ButtonThemeData(
    buttonColor: Colors.blue, // Set the background color of buttons
    textTheme: ButtonTextTheme.normal, // Use the default text color for buttons
  );

  static ButtonThemeData darkButtonTheme = ButtonThemeData(
    buttonColor: Colors.grey, // Set the background color of buttons
    textTheme: ButtonTextTheme.normal, // Use the default text color for buttons
  );
}
