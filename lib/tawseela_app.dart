import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // لإضافة Future.delayed
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/features/home/ui/screens/home.dart';
import 'package:tewseela_app/features/auth/ui/screens/login.dart';
import 'package:tewseela_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:tewseela_app/features/home/ui/widgets/bottom_nav_bar.dart';

class TawseelaApp extends StatelessWidget {
  const TawseelaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..checkAuthStatus(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          // عرض شاشة الأنيميشن في البداية
          return const LoadingWithAnimation();
        },
      ),
    );
  }
}

class LoadingWithAnimation extends StatefulWidget {
  const LoadingWithAnimation({super.key});

  @override
  State<LoadingWithAnimation> createState() => _LoadingWithAnimationState();
}

class _LoadingWithAnimationState extends State<LoadingWithAnimation> {
  @override
  void initState() {
    super.initState();
    // الانتظار 5 ثواني ثم الانتقال للشاشة المناسبة
    Future.delayed(const Duration(seconds: 3), () {
      final authState = context.read<AuthCubit>().state;

      if (authState is Authenticated) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Lottie.asset(
            'assets/animations/MMNSURs8Py.json',
            repeat: true,
            frameRate: FrameRate.max,
          ),
        ),
      ),
    );
  }
}
