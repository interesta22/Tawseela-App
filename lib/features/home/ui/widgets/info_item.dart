import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String subitle;
  const InfoItem({
    super.key, required this.title, required this.subitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: FontManager.font13GreySemibold,
        ),
        verticaalSpacing(10),
        Text(
          subitle,
          style: FontManager.font13BlackSemibold,
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
