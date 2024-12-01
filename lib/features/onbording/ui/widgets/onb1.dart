import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';
// import 'package:tawssela2_app/widgets/TopViewOnb.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  // ignore: non_constant_identifier_names
  final Widget? TopViewOnbrding;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    // ignore: non_constant_identifier_names
    required this.TopViewOnbrding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // الجزء العلوي: صورة، ثم النصوص واللوجو
        TopViewOnbrding!,
        const SizedBox(height: 20),

        // صورة منتصف الصفحة
        Image.asset(
          image,
          height: 250,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),

        // النصوص السفلية
        Text(
          title,
          style: AppTextStyles.titelOnBording1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            description,
            style: AppTextStyles.DescriptionOnBording1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
