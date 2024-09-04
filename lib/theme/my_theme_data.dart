
import 'package:flutter/material.dart';
import 'package:news_app/theme/app_color.dart';

class MyThemeData{
  static final lightTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primaryColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),
    // Text Theme
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        color: AppColor.whiteColor,
      )
    )
  );
}