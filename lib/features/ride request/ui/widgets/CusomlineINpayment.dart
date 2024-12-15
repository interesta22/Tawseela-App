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
          // النص القيم
          Expanded(
            child: Text(
              textValue ?? 'N/A', // إظهار قيمة بديلة في حالة وجود قيمة فارغة
              style: AppTextStyles.priceTrip,
              overflow:
                  TextOverflow.ellipsis, // النص يتقيد بالعرض في حال كان طويلًا
              softWrap: false, // عدم التفاف النصوص
            ),
          ),
          // النص العنوان
          Flexible(
            child: Text(
              textName ?? 'N/A', // إظهار قيمة بديلة في حالة وجود قيمة فارغة
              style: AppTextStyles.paymntText1,
              textAlign: TextAlign.end, // محاذاة النص للجهة اليمنى
            ),
          ),
        ],
      ),
    );
  }
}
