import 'package:flutter/material.dart';

class NewsTheme{
  static Color primaryColor = Color(0xff39A552);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color darkGreyColor = Color(0xff42505C);
  static Color lighterGreyColor = Color(0xff79828B);
  static  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme:AppBarTheme(
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
      ),
      backgroundColor: primaryColor,
      centerTitle: true ,
      titleTextStyle: TextStyle(
        color:whiteColor,
        fontSize: 22
      )
    )
  );
}