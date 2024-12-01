import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';

class LgoWidget extends StatelessWidget {
  // final Color color;
  const LgoWidget({
    super.key,
    // required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 50,
      left: 105,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(height: 5),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'توصيلة',
                    style: AppTextStyles.logo_Style1,
                    // selectionColor: color,
                  ),
                  Text(
                    " خطوتك الأولى للراحة والأمان", // النص بجانب اللوجو
                    style: AppTextStyles.logo_Style2,
                    //  selectionColor: color,
                  ),
                ],
              ),
              Image(
                image: AssetImage('assets/images/Default 1.png'),
                height: 50,
                width: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
