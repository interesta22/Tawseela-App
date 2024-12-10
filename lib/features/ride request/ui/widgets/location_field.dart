import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  const LocationField({
    super.key,
    required this.title,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextField(
        readOnly: true,
        controller: controller,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          hintText: title,
          hintStyle: FontManager.font16BlackLight,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none, // لإزالة حدود الـ TextField
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        ),
        style: FontManager.font16BlackLight,
      ),
    );
  }
}
