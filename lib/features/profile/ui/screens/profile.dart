import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/CusomAppBarCar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';
import 'package:tewseela_app/features/profile/ui/widgets/profile_menu.dart';
import 'package:tewseela_app/features/Notifications/ui/widgets/CusomAppBar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight, // ضبط المحاذاة إلى اليمين
                  child: CusomAppBar(
                    title: 'ملفي',
                  ),
                ),
                verticaalSpacing(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'احمد عبدالعزيز',
                          style: FontManager.font16BlackSemibold,
                        ),
                        verticaalSpacing(15),
                        Text(
                          '01278576046',
                          style: FontManager.font13GreySemibold,
                        ),
                      ],
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/Chill_guy_original_artwork.jpg',
                        fit: BoxFit.fill,
                        height: 130.h,
                      ),
                    ),
                    
                  ],
                ),
                verticaalSpacing(15),
                ProfileMenu(text: 'تعديل الملف', icon: HugeIcons.strokeRoundedUser),
                ProfileMenu(text: 'العناوين', icon: HugeIcons.strokeRoundedLocation01),
                ProfileMenu(text: 'القسائم ', icon: HugeIcons.strokeRoundedTicket01),
                ProfileMenu(text: 'العروض', icon: HugeIcons.strokeRoundedSaleTag02),
                ProfileMenu(text: 'عن التطبيق', icon: HugeIcons.strokeRoundedInformationCircle),
                ProfileMenu(text: 'تسجيل خروج', icon: HugeIcons.strokeRoundedLogout02),
                ProfileMenu(text: 'حذف الحساب', icon: HugeIcons.strokeRoundedUserRemove01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

