import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/snackbar.dart';
import 'package:tewseela_app/core/constants/app_colors.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';
// ignore: camel_case_types
// import 'package:tawssela2_app/core/utils/custom_snackbar.dart'; // استدعاء CustomSnackBar

// ignore: camel_case_types
class buttomWidget extends StatelessWidget {
  const buttomWidget({
    super.key,
    required this.selectedPaymentMethod,
  });

  final String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(300, 50),
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if (selectedPaymentMethod != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.build(
                'تم اختيار طريقة الدفع: $selectedPaymentMethod',
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.build('يرجى اختيار طريقة دفع!'),
            );
          }
        },
        child: const Text(
          'تأكيد الدفع',
          style: AppTextStyles.buttonTextpayment,
        ),
      ),
    );
  }
}
