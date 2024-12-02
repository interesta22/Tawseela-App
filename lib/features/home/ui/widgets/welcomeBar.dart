import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';

class WelcomeBar extends StatelessWidget {
  const WelcomeBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('اهلا احمد', style: FontManager.font16BlackSemibold),
        horizentalSpacing(15),
        CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.3),
          child: Icon(Icons.person_2),
        ),
      ],
    );
  }
}
