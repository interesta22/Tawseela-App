import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';
import 'package:tewseela_app/features/home/ui/widgets/info_item.dart';
import 'package:tewseela_app/features/home/ui/widgets/welcomeBar.dart';
import 'package:tewseela_app/features/home/logic/cubit/trip_cubit.dart';
import 'package:tewseela_app/features/home/ui/widgets/slider_view.dart';
import 'package:tewseela_app/features/home/ui/widgets/container_choise.dart';
import 'package:tewseela_app/features/Notifications/ui/widgets/CusomeNoNotif.dart';

class HomeScreen extends StatefulWidget {
  static String id = '/HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    super.initState();
    // تحقق من أن userId ليس فارغًا
    if (userId == null) {
      // يمكن إظهار رسالة خطأ أو إجراء عملية إعادة توجيه للمستخدم
      return;
    }
    // جلب الرحلة الجارية عندما يتم تحميل الشاشة
    context.read<TripCubit>().fetchCurrentTrip(uid: userId!);
  }

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
                    onTap: () {
                      context.pushNamed(Routes.trackLocation);
                    },
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
                  onTap: () {
                      context.pushNamed(Routes.trackLocation);
                    },
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
                      'رحلتي الجارية',
                      style: FontManager.font18BlackSemibold,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
                verticaalSpacing(15),

                // استخدام BlocBuilder لعرض الرحلة الجارية
                BlocBuilder<TripCubit, TripState>(builder: (context, state) {
                  if (state is TripLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is TripLoaded) {
                    var tripData = state.tripData;
                    // تحقق من البيانات هنا
                    if (tripData.isEmpty) {
                      return Center(
                          child: Text('لا توجد بيانات للرحلة الحالية.'));
                    }
                    return Padding(
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
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        tripData['from'] ?? 'غير محدد',
                                        style: FontManager.font17BlackLight,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
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
                                  direction: Axis.vertical,
                                  lineLength: 30,
                                  dashLength: 4.0,
                                  dashGapLength: 4.0,
                                  dashColor: ColorManager.mainColor,
                                  lineThickness: 2.0,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        tripData['to'] ?? 'غير محدد',
                                        style: FontManager.font17BlackLight,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InfoItem(
                                    title: 'السعر',
                                    subitle: '${tripData['price']} ج.م',
                                  ),
                                  InfoItem(
                                    title: 'الوقت',
                                    subitle: '${tripData['time']} د',
                                  ),
                                  InfoItem(
                                    title: 'المسافة',
                                    subitle: '${tripData['dis']} كم',
                                  ),
                                ],
                              ),
                            ),
                            verticaalSpacing(15),
                          ],
                        ),
                      ),
                    );
                  } else if (state is TripError) {
                    return Center(
                      child: Column(
                        children: [
                          Image.asset(
                            height: 250.h,
                            'assets/images/rb_19594 1.png',
                          ),
                          Text(
                            'مفيش رحلات جارية ليك في الوقت الحالي',
                            style: AppTextStyles.NonNotificationStyle,
                          ),
                        ],
                      ),
                    );
                  }
                  return SizedBox.shrink(); // إذا كانت الحالة غير متوقعة
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
