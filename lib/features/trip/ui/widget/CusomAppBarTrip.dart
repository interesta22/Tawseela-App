import 'package:flutter/material.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';


class CusomAppBarTrip extends StatelessWidget {
  const CusomAppBarTrip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          ' رحلاتي',
          style: AppTextStyles.AppbarTittel,
        ),
        horizentalSpacing(10),
      ],
    );
  }
}
