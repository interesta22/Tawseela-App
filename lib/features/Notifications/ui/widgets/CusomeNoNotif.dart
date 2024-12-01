import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';

// ignore: camel_case_types
class cusomNONotifica extends StatelessWidget {
  const cusomNONotifica({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/rb_19594 1.png'),
          Text(
            'خلاص مفيش  اشعارات تاني',
            style: AppTextStyles.NonNotificationStyle,
          ),
        ],
      ),
    );
  }
}