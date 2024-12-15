import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';
import 'package:tewseela_app/features/home/ui/widgets/bottom_nav_bar.dart';

class Endpag extends StatelessWidget {
  static String id = '/Endpag';
  const Endpag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, right: 10.w, left: 10.w),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Center(
                  child: Image.asset(
                    'assets/images/Illustration 2.png',
                    width: 210.w,
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'تم الحجز بنجاح',
                  style: AppTextStyles.endtext1,
                ),
                const SizedBox(height: 20),
                const Text(
                  'وسائقنا في الطريق',
                  style: AppTextStyles.endtext2,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  backgroundColor: ColorManager.mainColor,
                  buttonText: 'العودة للرئيسية',
                  textStyle: FontManager.font15WhiteMedium,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.bottomNavBar, // اسم المسار الذي تريد الانتقال إليه
                      (route) =>
                          false, // هذا يجعلنا نزيل جميع الصفحات من المكدس
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
