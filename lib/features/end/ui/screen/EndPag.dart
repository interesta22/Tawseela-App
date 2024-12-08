import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_colors.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';


class Endpag extends StatelessWidget {
  static String id = '/Endpag';
  const Endpag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Center(
            child: Image.asset('assets/images/Illustration 2.png'),
          ),
          const SizedBox(height: 50),
          const Text(
            'تم الحجز بنجاح',
            style: AppTextStyles.endtext1,
          ),
          const SizedBox(height: 20),
          const Text(
            'وسائقنا في الطريق',
            style: AppTextStyles.endtext2,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 50),
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'انهاء',
              style: AppTextStyles.endbuttom,
            ),
          )
        ],
      ),
    );
  }
}
