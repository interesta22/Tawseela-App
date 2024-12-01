import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_colors.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';


class CusomeContainerCar extends StatelessWidget {
  final String carName;
  final String carColor;
  final String carPrice;
  final String carImage;
  const CusomeContainerCar({
    super.key,
    required this.carName,
    required this.carColor,
    required this.carPrice,
    required this.carImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'سيارة $carName',
                  style: AppTextStyles.carName,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  'اللون :  $carColor |  الأجرة : $carPrice ج.م',
                  style: AppTextStyles.detilsCar,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'تأكيد',
                      style: AppTextStyles.buttonTextcar,
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: -35,
              left: 0,
              child: Image.asset(
                carImage, // مسار الصورة
                width: 140,
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
