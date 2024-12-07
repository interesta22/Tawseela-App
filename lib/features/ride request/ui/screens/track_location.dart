import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tewseela_app/features/ride%20request/ui/widgets/location_field.dart';

class TrackLocation extends StatelessWidget {
  const TrackLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لضبط الاتجاه من اليمين إلى اليسار
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              // الخلفية (صورة الخريطة)
              Positioned.fill(
                child: Image.asset(
                  'assets/images/image 10.png', // ضع مسار الصورة هنا
                  fit: BoxFit.cover, // تجعل الصورة تغطي الشاشة بالكامل
                ),
              ),
              // المحتوى فوق الخلفية
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        HugeIcons.strokeRoundedArrowRight01,
                        size: 30,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.locationCrosshairs,
                                color: ColorManager.mainColor,
                              ),
                            ),
                            DottedLine(
                              direction: Axis.vertical,
                              lineLength: 40.h,
                              dashLength: 4.0,
                              dashGapLength: 4.0,
                              dashColor: ColorManager.mainColor,
                              lineThickness: 2.0,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.locationDot,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LocationField(title: 'موقعي الحالي'),
                              SizedBox(height: 20.h), // مسافة بين الحقول
                              LocationField(title: 'الوجهة القادمة'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(), // يضيف مساحة فارغة لدفع الزر للأسفل
                    CustomButton(
                      buttonText: 'تأكيد',
                      textStyle: FontManager.font15WhiteMedium,
                      onPressed: () {
                        context.pushNamed(Routes.carScreen);
                      },
                      backgroundColor: ColorManager.mainColor,
                    ),
                    SizedBox(height: 20.h), // مسافة تحت الزر
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
