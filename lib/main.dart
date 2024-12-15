import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tewseela_app/tawseela_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/features/home/logic/cubit/trip_cubit.dart';
import 'package:tewseela_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:tewseela_app/features/onboarding/ui/screens/onboarding.dart';
import 'package:tewseela_app/features/onboarding/logic/onboarding_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // تهيئة Firebase
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TripCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp(
        theme: _buildAppTheme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter().generateRoute,
        home: BlocProvider(
          create: (context) => OnboardingCubit()..checkOnboardingSeen(),
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              if (state is OnboardingLoading) {
                return Scaffold(
                  body: Center(
                    child: Lottie.asset(
                      'assets/animations/MMNSURs8Py.json',
                      repeat: true,
                      frameRate: FrameRate.max,
                    ),
                  ),
                );
              } else if (state is OnboardingNotSeen) {
                return const OnboardingScreen();
              } else {
                return TawseelaApp();
              }
            },
          ),
        ),
      ),
    );
  }

  ThemeData _buildAppTheme() {
    return ThemeData(
      primaryColor: ColorManager.mainColor,
      scaffoldBackgroundColor: ColorManager.mainWhite,
      secondaryHeaderColor: ColorManager.mainColor,
    );
  }
}
