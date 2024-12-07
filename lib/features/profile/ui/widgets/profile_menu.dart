import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: ColorManager.mainColor,
          padding: const EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios,
              color: ColorManager.mainBlack,
            ),
            Spacer(),
            Text(text, style: FontManager.font13BlackSemibold),
            const SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // خلفية بيضاء
                shape: BoxShape.circle, // تجعل الشكل دائري
              ),
              padding: EdgeInsets.all(8.w),
              child: Icon(
                icon,
                color: ColorManager.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
