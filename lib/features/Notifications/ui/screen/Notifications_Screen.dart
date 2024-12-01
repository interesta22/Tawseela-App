// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';
import 'package:tewseela_app/features/Notifications/ui/widgets/CusomAppBar.dart';
import 'package:tewseela_app/features/Notifications/ui/widgets/CusomNotifcation.dart';
import 'package:tewseela_app/features/Notifications/ui/widgets/CusomeNoNotif.dart';


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
          // backgroundColor: AppColors.backgroundColor,
          // elevation: 5,
          title: const CusomAppBar(),
          titleTextStyle: AppTextStyles.AppbarTittel,
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CusomNotifcatio(),
              cusomNONotifica(),
            ],
          ),
        ));
  }
}
