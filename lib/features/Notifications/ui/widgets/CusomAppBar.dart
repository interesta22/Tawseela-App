import 'package:flutter/material.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';

class CusomAppBar extends StatelessWidget {
  final String title;
  const CusomAppBar({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(title, style: AppTextStyles.AppbarTittel),
        horizentalSpacing(10),
      ],
    );
  }
}
