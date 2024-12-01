import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tewseela_app/core/constants/app_colors.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';


class CusomCardTrip extends StatelessWidget {
  final String fromTripName;
  final String toTripName;
  final String tripDate;
  final String priceTrip;
  const CusomCardTrip({
    super.key,
    required this.fromTripName,
    required this.toTripName,
    required this.tripDate,
    required this.priceTrip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
          // border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.backgroundColor,
          // color: const Color(0xFFE5E5E5),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  fromTripName,
                  style: AppTextStyles.fromintrip,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.locationCrosshairs,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tripDate,
                    style: AppTextStyles.datetrip,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/Line 2.png'),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  toTripName,
                  style: AppTextStyles.fromintrip,
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
            const Divider(
              color: Colors.grey,
              thickness: sqrt1_2,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 26),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.grey,
                      // size: 10,
                    ),
                  ),
                  if (true)
                    const Text('اكتملت', style: AppTextStyles.buttonTexttrip),
                  // else{
                  //   const Text('قيد التنفيذ', style: AppTextStyles.buttonTexttrip)
                  // }
                  const Spacer(),
                  Text(
                    '$priceTrip م.ج',
                    style: AppTextStyles.fromintrip,
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //     Icons.attach_money_outlined,
                  //     color: Colors.grey,
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
