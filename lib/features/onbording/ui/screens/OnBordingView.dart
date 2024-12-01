// ignore: file_names
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';
import 'package:tewseela_app/core/widgets/LogoWidgets.dart';
import 'package:tewseela_app/features/home/ui/screens/home.dart';
import 'package:tewseela_app/features/onbording/ui/widgets/TopViewOnb.dart';
import 'package:tewseela_app/features/onbording/ui/widgets/onb1.dart';


class OnboardingScreen extends StatefulWidget {
  static String id = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const OnboardingPage(
        image: 'assets/images/rb_9919.png',
        title: "وسيلتك الأسهل للسفر ",
        description: "سواء مسافة طويلة أو قصيرة، توصيلة معاك خطوة بخطوة",
        TopViewOnbrding: TopViewOnbrdingWidget(
          image: "assets/images/Shape 1.png",
          logo: LgoWidget(
              // color: AppColors.backgroundColor,
              ),
        ),
      ),
      const OnboardingPage(
        image: "assets/images/rb_14312.png",
        title: " أمانك أولويتنا",
        description: " مع سائقين موثوقين ورحلات آمنة، هنوصلك بأمان.",
        TopViewOnbrding: TopViewOnbrdingWidget(
          //??????????????????????????????????????????????????????????????????
          image: "assets/images/shape2_modified.png",
          //???????????????????????????????????????????????????????????????????
          logo: LgoWidget(
              // color: AppColors.primaryColor,
              ),
        ),
      ),
      const OnboardingPage(
        image: "assets/images/rb_831.png",
        title: " راحتك تبدأ من هنا",
        description: "اختيارات مرنة، أسعار مناسبة، وتجربة بلا تعقيد.",
        TopViewOnbrding: TopViewOnbrdingWidget(
          image: "assets/images/shape3.png",
          logo: LgoWidget(
              // color: AppColors.scondeColor,
              ),
        ),
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 10,
                width: currentPage == index ? 20 : 10,
                decoration: BoxDecoration(
                  color: currentPage == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (currentPage == pages.length - 1) {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('seenOnboarding', true);
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(
                  // ignore: deprecated_member_use, use_build_context_synchronously
                    context,
                     HomeScreen.id); // استبدل '/home' بالشاشة الرئيسية
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            child: Text(
              currentPage == pages.length - 1 ? "ابدأ الآن" : "التالي",
              style: AppTextStyles.buttonText,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}


