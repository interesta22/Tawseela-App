// // onboarding_screen_logic.dart

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tawssela2_app/feature/home/ui/screens/homeView.dart';

// class OnboardingScreenLogic {
//   final PageController pageController = PageController();
//   int currentPage = 0;

//   void onPageChanged(int index) {
//     currentPage = index;
//   }

//   Future<void> onNextPage(BuildContext context, List<Widget> pages) async {
//     if (currentPage == pages.length - 1) {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setBool('seenOnboarding', true);
//       // ignore: use_build_context_synchronously
//       Navigator.pushReplacementNamed(context, Homeview.id);
//     } else {
//       pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeIn,
//       );
//     }
//   }
// }
