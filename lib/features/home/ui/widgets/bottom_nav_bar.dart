import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tewseela_app/features/home/ui/screens/home.dart';
import 'package:tewseela_app/features/trip/ui/screen/TripScreen.dart';
import 'package:tewseela_app/features/profile/ui/screens/profile.dart';
import 'package:tewseela_app/features/Notifications/ui/screen/Notifications_Screen.dart';
import 'package:tewseela_app/features/home/logic/nav%20bar%20cubit/bottom_vav_cubit_cubit.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: Scaffold(
        body: BlocBuilder<BottomNavCubit, int>(
          builder: (context, currentIndex) {
            return PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const [
                HomeScreen(),
                Tripscreen(),
                NotificationScreen(),
                ProfileScreen(),
              ],
              onPageChanged: (index) {
                context.read<BottomNavCubit>().changeTab(index);
              },
            );
          },
        ),
        bottomNavigationBar: Directionality(
          textDirection: TextDirection.rtl, // اجعل الاتجاه من اليمين إلى اليسار
          child: BlocBuilder<BottomNavCubit, int>(
            builder: (context, currentIndex) {
              return SalomonBottomBar(
                backgroundColor: ColorManager.mainWhite,
                selectedItemColor: ColorManager.mainColor,
                unselectedItemColor: const Color(0xff757575),
                currentIndex: currentIndex,
                onTap: (index) {
                  // تحديث الحالة عند النقر
                  _pageController.jumpToPage(index);
                  context.read<BottomNavCubit>().changeTab(index);
                },
                items: [
                  SalomonBottomBarItem(
                    icon: const Icon(HugeIcons.strokeRoundedHome03),
                    title: const Text(
                      'الرئيسية',
                      style: TextStyle(fontFamily: 'Alexandria'),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(HugeIcons.strokeRoundedCar04),
                    title: const Text(
                      'رحلاتي',
                      style: TextStyle(fontFamily: 'Alexandria'),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(HugeIcons.strokeRoundedNotification03),
                    title: const Text(
                      'الاشعارات',
                      style: TextStyle(fontFamily: 'Alexandria'),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(HugeIcons.strokeRoundedUser),
                    title: const Text(
                      'ملفي',
                      style: TextStyle(fontFamily: 'Alexandria'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
