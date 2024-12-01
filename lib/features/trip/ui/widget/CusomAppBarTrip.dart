
import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';

class CusomAppBarTrip extends StatelessWidget {
  const CusomAppBarTrip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          ' رحلاتي',
          style: AppTextStyles.AppbarTittel,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.black,
        )
      ],
    );
  }
}
