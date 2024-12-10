import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tewseela_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:tewseela_app/features/onboarding/logic/onboarding_cubit.dart';
import 'package:tewseela_app/features/onboarding/ui/widgets/onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            reverse: true,
            controller: pageController,
            onPageChanged: _onPageChanged,
            children: const [
              OnboardingItem(
                svg: 'assets/images/rb_9919 copy.png',
                title: 'وسيلتك الأسهل للسفر',
                subTitle: 'سواء مسافة طويلة أو قصيرة، توصيلة معاك خطوة بخطوة',
              ),
              OnboardingItem(
                svg: 'assets/images/rb_14312 copy.png',
                title: 'أمانك أولويتنا',
                subTitle: 'مع سائقين موثوقين ورحلات آمنة، هنوصلك بأمان.',
              ),
              OnboardingItem(
                svg: 'assets/images/rb_831 copy.png',
                title: 'راحتك تبدأ من هنا',
                subTitle: 'اختيارات مرنة، أسعار مناسبة، وتجربة بلا تعقيد.',
              ),
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.42,
            bottom: 50,
            child: SmoothPageIndicator(
              textDirection: TextDirection.rtl,
              controller: pageController,
              count: 3,
              effect: WormEffect(
                dotHeight: 7,
                dotWidth: 10,
                spacing: 15,
                dotColor: ColorManager.mainColor.withOpacity(0.4),
                activeDotColor: ColorManager.mainColor,
              ),
            ),
          ),
          // زر تخطي
          if (currentPage != 2)
            Positioned(
              top: 40.h,
              right: 20.w,
              child: TextButton(
                onPressed: () {
                  pageController.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  'تخطي',
                  style: TextStyle(
                    color: ColorManager.mainColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          // زر ابدأ
    
          Positioned(
            child: Image.asset('assets/images/Shape 1.png'),
          ),
          Positioned(
            top: 100.h, // يمكنك تعديل هذا الرقم لضبط الموضع العمودي
            left: 50.w,
            child: Image.asset('assets/images/white baner.png'),
          ),
          if (currentPage == 2)
            Positioned(
              bottom: 85.h,
              left: 20.w,
              right: 20.w,
              child: ElevatedButton(
                onPressed: () async{
                  await onboardingCubit.onboardingSeen();
                  context.pushNamed(Routes.phoneScreen);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100.w, 40.h), // الحجم الأدنى للزر
                  backgroundColor: ColorManager.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                ),
                child: Text(
                  '!ابدأ الآن',
                  style: FontManager.font15WhiteMedium,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
