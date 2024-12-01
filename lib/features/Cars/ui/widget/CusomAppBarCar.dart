
import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';

class CusomAppBarCar extends StatelessWidget {
  const CusomAppBarCar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'السيارات المتاحة للرحلة',
          style: AppTextStyles.titelNoti,
        ),
        Icon(Icons.arrow_forward_ios_outlined),
        // SizedBox(width: 10),
      ],
    );
  }
}
