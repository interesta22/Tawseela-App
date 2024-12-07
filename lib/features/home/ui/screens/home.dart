import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tewseela_app/features/home/ui/widgets/info_item.dart';
import 'package:tewseela_app/features/home/ui/widgets/welcomeBar.dart';
import 'package:tewseela_app/features/home/ui/widgets/slider_view.dart';
import 'package:tewseela_app/features/home/ui/widgets/container_choise.dart';


class HomeScreen extends StatefulWidget {
  static String id = '/HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, right: 10.w, left: 10.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: const WelcomeBar(),
                ),
                verticaalSpacing(20),
                const SliderView(),
                verticaalSpacing(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: GestureDetector(
                    onTap: (){context.pushNamed(Routes.trackLocation);},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(HugeIcons.strokeRoundedLocation05),
                          Text(
                            'رايح فين؟',
                            style: FontManager.font18BlackRegular,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                verticaalSpacing(20),
                ChoiseContainer(
                  title: 'اختار من عنواينك',
                  icon: HugeIcons.strokeRoundedStar,
                  onTap: () {},
                ),
                verticaalSpacing(5),
                ChoiseContainer(
                  title: 'اختار عنوان جديد',
                  icon: HugeIcons.strokeRoundedLocation03,
                  onTap: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h, bottom: 15.h),
                  child: Divider(
                    color: Colors.grey.shade400,
                    indent: 25,
                    endIndent: 25,
                    thickness: 0.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Align(
                    child: Text(
                      'رحلتي الحالية',
                      style: FontManager.font18BlackSemibold,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
                verticaalSpacing(15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF7F7F7),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Color(0xff3D7E64),
                              child: Icon(
                                Icons.call,
                                size: 25,
                                color: ColorManager.mainWhite,
                              ),
                            ),
                            horizentalSpacing(10),
                            const CircleAvatar(
                              backgroundColor: ColorManager.mainColor,
                              child: Icon(
                                HugeIcons.strokeRoundedMessage01,
                                size: 25,
                                color: ColorManager.mainWhite,
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'ايجون تارجيريان',
                                  style: FontManager.font18BlackRegular,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star_rounded,
                                      color: Color(0xffFFCC00),
                                    ),
                                    horizentalSpacing(5),
                                    Text(
                                      '4.4',
                                      style: FontManager.font18BlackRegular,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            horizentalSpacing(15),
                            CircleAvatar(
                              radius: 25,
                              child: Image.asset('assets/images/Oval 2.png'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'العجمي - فضة',
                              style: FontManager.font17BlackLight,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesomeIcons.locationCrosshairs,
                                color: ColorManager.mainColor,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: const Align(
                              alignment: Alignment.centerRight,
                              child: DottedLine(
                                direction: Axis.vertical, // اتجاه الخط رأسي
                                lineLength: 30, // طول الخط
                                dashLength: 4.0, // طول كل مقطع
                                dashGapLength: 4.0, // المسافة بين المقاطع
                                dashColor: ColorManager.mainColor, // لون الخط
                                lineThickness: 2.0, // عرض الخط
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'كفر الشيخ - مركز مطوبس',
                              style: FontManager.font17BlackLight,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesomeIcons.locationDot,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey.shade400,
                          indent: 15,
                          endIndent: 15,
                          thickness: 0.5,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InfoItem(
                                title: 'السعر',
                                subitle: '170 ج.م',
                              ),
                              InfoItem(
                                title: 'الوقت',
                                subitle: '2 س',
                              ),
                              InfoItem(
                                title: 'المسافة',
                                subitle: '200 كم',
                              ),
                            ],
                          ),
                        ),
                        verticaalSpacing(15),
                        CustomButton(
                          buttonText: 'الغاء الرحلة',
                          textStyle: FontManager.font15WhiteMedium,
                          onPressed: () {},
                          backgroundColor: ColorManager.mainBlack,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
