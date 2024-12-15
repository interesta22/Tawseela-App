import 'dart:async'; // لإضافة Timer
import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tewseela_app/features/home/ui/widgets/welcome_slider.dart';

class SliderView extends StatefulWidget {
  const SliderView({super.key});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  final PageController pageController = PageController();
  late Timer _timer; // تعريف الـ Timer
  List<WelcomeSlider> sliders = const [
    WelcomeSlider(
      title: 'دايماً معاك',
      subTitle: 'في كل خطوة ومشوار',
      img: 'assets/images/1.png',
    ),
    WelcomeSlider(
      title: 'رحلات مريحة',
      subTitle: 'وامنة لأن راحتك تهمنا',
      img: 'assets/images/2.png',
    ),
    WelcomeSlider(
      title: 'وجهتك بين ايديك',
      subTitle: 'بخطوات بسيطة وآمنة',
      img: 'assets/images/3.png',
    ),
    WelcomeSlider(
      title: 'نوصل أحلامك',
      subTitle: 'مش بس مشاويرك',
      img: 'assets/images/4.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // بدء الـ Timer للتنقل بين الصفحات كل 4 ثواني
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (pageController.page != null) {
        int nextPage = (pageController.page! + 1).toInt() % sliders.length;
        pageController.animateToPage(nextPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // إلغاء الـ Timer عند التخلص من الـ widget
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            reverse: true,
            controller: pageController,
            itemCount: 4, // عدد الكروت
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.w), // مسافة بين الكروت
                child: WelcomeSlider(
                  title: sliders[index].title,
                  subTitle: sliders[index].subTitle,
                  img: sliders[index].img, // تغيير الصورة وفقًا للـ index
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: Center(
            child: SmoothPageIndicator(
              textDirection: TextDirection.rtl,
              controller: pageController,
              count: 4,
              effect: WormEffect(
                dotHeight: 5,
                dotWidth: 7,
                spacing: 15,
                dotColor: ColorManager.mainWhite.withOpacity(0.4),
                activeDotColor: ColorManager.mainWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
