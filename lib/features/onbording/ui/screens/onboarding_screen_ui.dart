// // onboarding_screen_ui.dart

// import 'package:flutter/material.dart';
// import 'package:tawssela2_app/feature/onbording/logic/onboarding_screen_logic.dart';
// import 'package:tawssela2_app/feature/onbording/ui/widgets/onb1.dart';
// import 'package:tawssela2_app/core/widgets/LogoWidgets.dart';
// import 'package:tawssela2_app/feature/onbording/ui/widgets/TopViewOnb.dart';
// // import 'onboarding_screen_logic.dart';  // استيراد المنطق

// class OnboardingScreenUI extends StatelessWidget {
//   final OnboardingScreenLogic logic = OnboardingScreenLogic();

//   OnboardingScreenUI({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final pages = [
//       const OnboardingPage(
//         image: 'assets/images/rb_9919.png',
//         title: "وسيلتك الأسهل للسفر ",
//         description: "سواء مسافة طويلة أو قصيرة، توصيلة معاك خطوة بخطوة",
//         TopViewOnbrding: TopViewOnbrdingWidget(
//           image: "assets/images/Shape 1.png",
//           logo: LgoWidget(),
//         ),
//       ),
//       const OnboardingPage(
//         image: "assets/images/rb_14312.png",
//         title: " أمانك أولويتنا",
//         description: " مع سائقين موثوقين ورحلات آمنة، هنوصلك بأمان.",
//         TopViewOnbrding: TopViewOnbrdingWidget(
//           image: "assets/images/shape2_modified.png",
//           logo: LgoWidget(),
//         ),
//       ),
//       const OnboardingPage(
//         image: "assets/images/rb_831.png",
//         title: " راحتك تبدأ من هنا",
//         description: "اختيارات مرنة، أسعار مناسبة، وتجربة بلا تعقيد.",
//         TopViewOnbrding: TopViewOnbrdingWidget(
//           image: "assets/images/shape3.png",
//           logo: LgoWidget(),
//         ),
//       ),
//     ];

//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               controller: logic.pageController,
//               itemCount: pages.length,
//               onPageChanged: (index) {
//                 logic.onPageChanged(index);
//               },
//               itemBuilder: (context, index) {
//                 return pages[index];
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               pages.length,
//               (index) => AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 margin: const EdgeInsets.symmetric(horizontal: 5),
//                 height: 10,
//                 width: logic.currentPage == index ? 20 : 10,
//                 decoration: BoxDecoration(
//                   color: logic.currentPage == index ? Colors.blue : Colors.grey,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () async {
//               await logic.onNextPage(context, pages);
//             },
//             child: Text(
//               logic.currentPage == pages.length - 1 ? "ابدأ الآن" : "التالي",
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
