import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeSlider extends StatelessWidget {
  final String title;
  final String subTitle;
  final String img;

  const WelcomeSlider({
    super.key,
    required this.title,
    required this.subTitle,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: MediaQuery.of(context).size.height * 0.2, // 20% من ارتفاع الشاشة
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorManager.mainColor,
      ),
      child: Row(
        children: [
          horizentalSpacing(5),
          // الصورة مع تحديد العرض والارتفاع المناسب
          Image.asset(
            img,
            height: 95.h,
            fit: BoxFit.cover, // لتصغير الصورة بشكل متناسب
          ),
          horizentalSpacing(15),// استخدام SizedBox بدلاً من `horizentalSpacing`
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.end, // محاذاة النص لليسار
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: FontManager.font21WhiteMedium,
                  overflow: TextOverflow.ellipsis, // لتجنب تجاوز النص
                  maxLines: 1, // تحديد عدد الأسطر للنص
                ),
                SizedBox(height: 5.h), // إضافة مسافة بين العنوان والوصف
                Text(
                  subTitle,
                  style: FontManager.font15WhiteMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          horizentalSpacing(10),
        ],
      ),
    );
  }
}
