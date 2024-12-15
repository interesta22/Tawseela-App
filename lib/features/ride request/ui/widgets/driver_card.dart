import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tewseela_app/features/home/ui/widgets/info_item.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({
    Key? key,
    required this.name,
    required this.rating,
    required this.isOnline,
    required this.img,
    required this.from,
    required this.to,
    required this.dis,
    required this.price,
    required this.arguments,
    required this.phone,
  }) : super(key: key);

  final String name;
  final String img;
  final String rating;
  final String isOnline;
  final String from;
  final String to;
  final String dis;
  final String price;
  final String phone;
  final Map<String, String> arguments;
  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'لا يمكن فتح تطبيق الاتصال';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (BuildContext context) {
            double distanceInDouble = double.parse(dis); // تحويل النص إلى رقم
            double time = distanceInDouble * 2.5; // النتيجة تبقى double
            time = double.parse(time.toStringAsFixed(
                2)); // لتقليل الدقة إلى رقمين عشريين إذا لزم الأمر

            String fare =
                (20 + (double.parse(dis) * double.parse(price)) + (time * 0.5))
                    .toStringAsFixed(2);

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
                        GestureDetector(
                          onTap: () {
                            _launchPhone();
                          },
                          child: const CircleAvatar(
                            backgroundColor: Color(0xff3D7E64),
                            child: Icon(
                              Icons.call,
                              size: 25,
                              color: ColorManager.mainWhite,
                            ),
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
                        const Expanded(child: SizedBox()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              name,
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
                                  rating,
                                  style: FontManager.font18BlackRegular,
                                ),
                              ],
                            ),
                          ],
                        ),
                        horizentalSpacing(15),
                        CircleAvatar(
                          radius: 25,
                          child: Image.network(img),
                        ),
                      ],
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
                                from,
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
                                to,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InfoItem(
                            title: 'السعر',
                            subitle: '$fare ج.م',
                          ),
                          InfoItem(
                            title: 'الوقت',
                            subitle: '$time د',
                          ),
                          InfoItem(
                            title: 'المسافة',
                            subitle: '$dis كم',
                          ),
                        ],
                      ),
                    ),
                    verticaalSpacing(15),
                    CustomButton(
                      buttonText: 'تأكيد الرحلة',
                      textStyle: FontManager.font15WhiteMedium,
                      onPressed: () {
                        arguments['dis'] = dis;
                        arguments['time'] = time.toString();
                        arguments['fare'] = fare;
                        arguments['driverName'] = name;
                        context.pushNamed(Routes.paymentSreen,
                            arguments: arguments);
                      },
                      backgroundColor: ColorManager.mainBlack,
                    ),
                    verticaalSpacing(15),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorManager.mainWhite,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    backgroundColor: ColorManager.mainColor,
                    radius: 40,
                    child: Image.network(img, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: FontManager.font16BlackSemibold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Text(
                            'التقييم :  $rating',
                            style: FontManager.font13BlackSemibold,
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
                ),
                SizedBox(width: 10.w),
                Row(
                  children: [
                    Text(isOnline == 'true' ? 'متصل الآن' : 'غير متصل',
                        style: isOnline == 'false'
                            ? FontManager.font14RedRegular
                            : FontManager.font14GreenRegular),
                    horizentalSpacing(7),
                    Container(
                      width: 10.w, // عرض النقطة
                      height: 10.h, // ارتفاع النقطة
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isOnline == 'true'
                            ? Colors.green
                            : Colors.red, // نفس اللون للنقطة
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
