import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tewseela_app/features/home/ui/widgets/info_item.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({
    Key? key,
    required this.name,
    required this.rating,
    required this.isOnline, // إضافة خاصية للتحقق من حالة السائق
  }) : super(key: key);

  final String name;
  final String rating;
  final String isOnline; // خاصية لتحديد حالة الاتصال

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // عند الضغط على الكارد، يتم عرض نافذة BottomSheet
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffF7F7F7),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                            direction: Axis.vertical,
                            lineLength: 30,
                            dashLength: 4.0,
                            dashGapLength: 4.0,
                            dashColor: ColorManager.mainColor,
                            lineThickness: 2.0,
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
                      buttonText: 'تأكيد الرحلة',
                      textStyle: FontManager.font15WhiteMedium,
                      onPressed: () {},
                      backgroundColor: ColorManager.mainBlack,
                    ),
                    verticaalSpacing(15)
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: 110.h,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: ColorManager.mainColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // مؤشر الحالة
              
              horizentalSpacing(10),
              // الصورة
              Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF979797).withOpacity(0.1),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/Chill_guy_original_artwork.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              horizentalSpacing(20),
              // الاسم والتقييم
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: FontManager.font16WhiteSemibold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Text(
                        rating,
                        style: FontManager.font15WhiteMedium,
                      ),
                      horizentalSpacing(4),
                      const Icon(
                        Icons.star_rounded,
                        color: Color(0xffFFCC00),
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
              horizentalSpacing(130),
              Container(
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isOnline == 'true'?Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
