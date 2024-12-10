import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/constants/app_colors.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';
import 'package:tewseela_app/features/ride%20request/ui/screens/drivers.dart';

class CusomeContainerCar extends StatelessWidget {
  final String carName;
  final String carColor;
  final double carPrice;
  final String carImage;
  final Map<String, String> arguments;

  const CusomeContainerCar({
    super.key,
    required this.carName,
    required this.carColor,
    required this.carPrice,
    required this.carImage,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        padding: const EdgeInsets.all(16),
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
                  carName,
                  style: AppTextStyles.carName,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  'اللون : $carColor | الأجرة : ${carPrice.toStringAsFixed(2)} ج.م',
                  style: AppTextStyles.detilsCar,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  backgroundColor: ColorManager.mainWhite,
                  buttonText: 'تأكيد',
                  textStyle: FontManager.font15BlueMedium,
                  onPressed: () {
                    arguments['price'] = carPrice.toString();
                    arguments['car'] = carName;
                    context.pushNamed(
                      Routes.driversScreen,
                      arguments: arguments,
                    );
                  },
                )
              ],
            ),
            Positioned(
              top: -35,
              left: 0,
              child: Image.network(
                fit: BoxFit.contain,
                carImage,
                width: 140,
                height: 140,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
