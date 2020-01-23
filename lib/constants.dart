import 'package:flutter/material.dart';

const Color kBackgroundColor = Color(0xff020202);
const Color kPrimaryColor = Color(0xffED1B24);

final ThemeData kTheme = ThemeData(
  backgroundColor: kBackgroundColor,
  scaffoldBackgroundColor: kBackgroundColor,
  primaryColor: kPrimaryColor,
  accentColor: kPrimaryColor,
  primaryIconTheme: IconThemeData(
    color: kPrimaryColor,
  ),
);

final TextStyle kHeadlineRed =
TextStyle(color: kPrimaryColor, fontSize: 16, fontWeight: FontWeight.w500);

final TextStyle kHeadlineWhite =
TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
