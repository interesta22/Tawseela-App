import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.svg,
  });

  final String svg;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // محتويات الشاشة
        Positioned(
          top: 340.h,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                // الصورة SVG
                Image.asset(
                  svg,
                  height: 250.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 12.h),
                // العنوان
                Text(
                  title,
                  style: FontManager.font26BlackBold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                // العنوان الفرعي
                Text(
                  subTitle,
                  style: FontManager.font16BlackLight,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        // زر "ابدأ الآن"
        
      ],
    );
  }
}
