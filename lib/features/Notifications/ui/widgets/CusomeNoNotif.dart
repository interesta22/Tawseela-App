import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';

// ignore: camel_case_types
class cusomNONotifica extends StatelessWidget {
  final String title;
  const cusomNONotifica({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/rb_19594 1.png'),
          Text(
            title,
            style: AppTextStyles.NonNotificationStyle,
          ),
        ],
      ),
    );
  }
}
