import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // لإضافة تنسيق التواريخ
import 'package:tewseela_app/core/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';

class CustomCardTrip extends StatelessWidget {
  final String fromTripName;
  final String toTripName;
  final String tripDate;
  final String priceTrip;
  final String tripStatus; // إضافة متغير الحالة

  const CustomCardTrip({
    Key? key,
    required this.fromTripName,
    required this.toTripName,
    required this.tripDate,
    required this.priceTrip,
    required this.tripStatus, // إضافة الحالة في البناء
  }) : super(key: key);

  /// دالة لتنسيق تاريخ الرحلة مع الوقت
  String _formatTripDate(dynamic tripDate) {
    final DateFormat dateFormatter = DateFormat('yyyy/MM/dd'); // صيغة التاريخ
    final DateFormat timeFormatter = DateFormat('HH:mm'); // صيغة الوقت
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);

    // إذا كان tripDate من نوع Timestamp
    if (tripDate is Timestamp) {
      final DateTime date = tripDate.toDate();
      String time = timeFormatter.format(date);
      if (_isSameDay(date, today)) return 'اليوم $time';
      if (_isSameDay(date, today.add(const Duration(days: 1))))
        return 'غدًا $time';
      return '${dateFormatter.format(date)} $time';
    }

    // إذا كان tripDate نص يمكن تحويله
    if (tripDate is String) {
      try {
        final DateTime date = DateTime.parse(tripDate);
        String time = timeFormatter.format(date);
        if (_isSameDay(date, today)) return 'اليوم $time';
        if (_isSameDay(date, today.add(const Duration(days: 1))))
          return 'غدًا $time';
        return '${dateFormatter.format(date)} $time';
      } catch (e) {
        return 'تاريخ غير صالح'; // معالجة الأخطاء
      }
    }

    // إذا لم يكن النوع مدعومًا
    return 'نوع التاريخ غير مدعوم';
  }

  /// دالة لمقارنة تاريخين للتأكد من أنهما في نفس اليوم
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjust size to fit children
          children: [
            // Row for "fromTripName" with location icon
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        fromTripName,
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
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            // Row for "tripDate" with timeline icon
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                _formatTripDate(tripDate), // استدعاء دالة تنسيق التاريخ
                style: AppTextStyles.datetrip,
              ),
            ),
            // Row for "toTripName" with location dot icon
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        toTripName,
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
            // Divider line
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            // Row for "priceTrip" and action buttons
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    tripStatus == 'جارية'
                        ? 'جارية'
                        : 'اكتملت', // النص بناءً على الحالة
                    style: tripStatus == 'جارية'
                        ? AppTextStyles.currentTrip // لون أخضر
                        : AppTextStyles.endTrip, // لون رمادي
                  ),
                  const Spacer(),
                  Text(
                    'ج.م $priceTrip',
                    style: AppTextStyles.fromintrip,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
