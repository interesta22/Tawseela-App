// custom_snackbar.dart
import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_colors.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';

class CustomSnackBar {
  static SnackBar build(String message) {
    return SnackBar(
      content: Text(
        message,
        style: AppTextStyles.SnackBar, // يمكن تعديلها حسب النصوص المطلوبة
      ),
      backgroundColor: AppColors.primaryColor,
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
    );
  }
}
