import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';

class CusomlineINpayment extends StatelessWidget {
  final String? textName;
  final String? textValue;
  const CusomlineINpayment({
    super.key,
    required this.textName,
    required this.textValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textValue!,
            style: AppTextStyles.paymntText2,
          ),
          Text(
            textName!,
            style: AppTextStyles.paymntText1,
          ),
        ],
      ),
    );
  }
}
