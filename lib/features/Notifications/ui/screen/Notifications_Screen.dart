import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';
import 'package:tewseela_app/features/Notifications/ui/widgets/CusomAppBar.dart';
import 'package:tewseela_app/features/Notifications/ui/widgets/CusomeNoNotif.dart';
import 'package:tewseela_app/features/Notifications/ui/widgets/CusomNotifcation.dart';
// import 'dart:math';



class NotificationScreen extends StatefulWidget {
  static String id = '/Notifications';
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorManager.mainWhite,
          title: const CusomAppBar(title: 'الاشعارات',),
          titleTextStyle: AppTextStyles.AppbarTittel,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CusomNotifcatio(),
                cusomNONotifica(),
              ],
            ),
          ),
        ));
  }
}
