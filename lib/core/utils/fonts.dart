import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/utils/fonts_weigh_helpert.dart';

class FontManager{
  static TextStyle font24BlueBold = TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 24.sp,
      color: ColorManager.mainColor,
      fontWeight: FontWeightHelper.bold);
      
  static TextStyle font20BlackBold = TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 20.sp,
      color: ColorManager.mainBlack,
      fontWeight: FontWeightHelper.bold);

  static TextStyle font13BlackRegular = TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 13.sp,
      color: ColorManager.mainBlack,
      fontWeight: FontWeightHelper.regular);

  static TextStyle font13BlueRegular = TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 13.sp,
      color: ColorManager.mainColor,
      fontWeight: FontWeightHelper.regular);

  static TextStyle font13BlackLight = TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 13.sp,
      color: ColorManager.mainBlack,
      fontWeight: FontWeightHelper.light);

  static TextStyle font15WhiteMedium = TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 15.sp,
      color: ColorManager.mainWhite,
      fontWeight: FontWeightHelper.medium);
}