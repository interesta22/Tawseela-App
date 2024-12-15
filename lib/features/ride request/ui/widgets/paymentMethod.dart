// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';

// ignore: camel_case_types
class paymentMethod extends StatelessWidget {
  final String title;
  final IconData icon;
  const paymentMethod({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          // 'بطاقة الائتمان',
          style: AppTextStyles.paymentmthod,
        ),
        const SizedBox(width: 10),
        Icon(
          icon,
          // Icons.credit_card,
          color: Colors.blue,
        ),
      ],
    );
  }
}
