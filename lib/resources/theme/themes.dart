import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:time_calculator/gen/colors.gen.dart';

import '../lang/strings.dart';
import 'colors.dart';

var appTheme = ThemeData(
  primaryColor: ColorName.skyBlue,
  primaryColorDark: AppColor.primaryDark,
  primaryColorLight: AppColor.white,
  hintColor: AppColor.textGray,
  platform: TargetPlatform.iOS,
  brightness: Brightness.light,
  fontFamily: "Montserrat",
  timePickerTheme: TimePickerThemeData(
    backgroundColor: ColorName.white,
    hourMinuteTextColor: ColorName.textBlack,
    dayPeriodColor: ColorName.white,
    helpTextStyle: TextStyle(
        fontSize: 3.sp,
        color: ColorName.red,
        fontWeight: FontWeight.w700,
        fontFamily: "Montserrat"),
    dialBackgroundColor: ColorName.skyBlue,
    dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.5.w))),
    hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.5.w))),
    dialHandColor: ColorName.textBlack,
    dialTextStyle: TextStyle(
        fontSize: 3.sp,
        fontWeight: FontWeight.w700,
        color: ColorName.textBlack,
        fontFamily: "Montserrat"),
    dayPeriodTextStyle: TextStyle(
        fontSize: 2.7.sp,
        fontWeight: FontWeight.w700,
        color: ColorName.textBlack,
        fontFamily: "Montserrat"),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.7.w)),
  ),
  textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 8.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.textBlack,
          fontFamily: "Montserrat"),
      titleMedium: TextStyle(
          fontSize: 6.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.textBlack,
          fontFamily: "Montserrat"),
      titleSmall: TextStyle(
          fontSize: 5.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.textBlack,
          fontFamily: "Montserrat"),
      labelMedium: TextStyle(fontSize: 4.5.sp, color: AppColor.textGray),
      labelSmall: TextStyle(
          fontSize: 3.5.sp, color: AppColor.textGray, letterSpacing: 0),
      bodyLarge: TextStyle(fontSize: 6.5.sp, color: AppColor.textBlack),
      bodyMedium: TextStyle(fontSize: 5.5.sp, color: AppColor.textBlack),
      bodySmall: TextStyle(fontSize: 3.7.sp, color: AppColor.textBlack)),
);
