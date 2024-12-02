import 'package:flutter/material.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';


class CusomAppBar extends StatelessWidget {
  const CusomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('الاشعارات'),
        horizentalSpacing(10),
      ],
    );
  }
}
