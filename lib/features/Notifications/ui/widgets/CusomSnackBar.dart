import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_colors.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';


class CusomSnakBar extends StatelessWidget {
  const CusomSnakBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: const Text(
        'تم حذف الإشعار',
        style: AppTextStyles.SnackBar,
      ),
                  backgroundColor: AppColors.primaryColor, // تخصيص لون الـ SnackBar
            duration: const Duration(seconds: 3), // مدة ظهور الـ SnackBar
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // إضافة زوايا مدورة
            ),
            behavior: SnackBarBehavior.floating, 
    );
  }
}