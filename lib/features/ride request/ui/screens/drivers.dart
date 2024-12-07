import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:tewseela_app/core/widgets/CusomAppBarCar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tewseela_app/features/home/ui/widgets/info_item.dart';
import 'package:tewseela_app/features/ride%20request/ui/widgets/driver_card.dart';

class DriversScreen extends StatelessWidget {
  DriversScreen({super.key});

  final drivers = [
    {'name': 'ريغار تارغيريان', 'rating': '4.5', 'isOnline': 'true'},
    {'name': 'تايوين لانيستر', 'rating': '4.7', 'isOnline': 'false'},
    {'name': 'اوبرين مارتيل', 'rating': '4.9', 'isOnline': 'true'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.mainWhite,
        automaticallyImplyLeading: false,
        title: const CustomAppBar(
          title: 'السائقين المتاحين للرحلة',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: drivers.length, // عدد العناصر في القائمة
          itemBuilder: (BuildContext context, int index) {
            final driver = drivers[index];
            return DriverCard(
              name: driver['name']!,
              rating: driver['rating']!,
              isOnline: driver['isOnline'] ?? 'false',
            );
          },
        ),
      ),
    );
  }
}
