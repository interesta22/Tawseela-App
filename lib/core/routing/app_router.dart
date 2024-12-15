import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/features/auth/ui/screens/otp.dart';
import 'package:tewseela_app/features/home/ui/screens/home.dart';
import 'package:tewseela_app/features/auth/ui/screens/phone.dart';
import 'package:tewseela_app/features/auth/ui/screens/login.dart';
import 'package:tewseela_app/features/auth/ui/screens/sign_up.dart';
import 'package:tewseela_app/features/trip/ui/screen/TripScreen.dart';
import 'package:tewseela_app/features/profile/ui/screens/profile.dart';
import 'package:tewseela_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:tewseela_app/features/home/ui/widgets/bottom_nav_bar.dart';
import 'package:tewseela_app/features/ride%20request/ui/screens/EndPag.dart';
import 'package:tewseela_app/features/onboarding/ui/screens/onboarding.dart';
import 'package:tewseela_app/features/ride%20request/ui/screens/drivers.dart';
import 'package:tewseela_app/features/ride%20request/ui/screens/Cars_Screen.dart';
import 'package:tewseela_app/features/ride%20request/ui/screens/PaymentScreen.dart';
import 'package:tewseela_app/features/ride%20request/logic/cubit/request_cubit.dart';
import 'package:tewseela_app/features/ride%20request/ui/screens/track_location.dart';
import 'package:tewseela_app/features/Notifications/ui/screen/Notifications_Screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.onBoardingScreen:
      //   return _buildRoute(const OnboardingScreen(), settings);
      case Routes.phoneScreen:
        return _buildRoute(
            BlocProvider(
              create: (context) => AuthCubit(),
              child: PhoneAuthScreen(),
            ),
            settings);

      case Routes.loginScreen:
        return _buildRoute(const LoginScreen(), settings);

      case Routes.homeScreen:
        return _buildRoute(const HomeScreen(), settings);

      case Routes.carScreen:
        // تأكد من وجود القيم المطلوبة هنا

        final arguments = settings.arguments as Map<String, String>;

        return _buildRoute(CarScreen(arguments: arguments), settings);

      case Routes.notificationScreen:
        return _buildRoute(const NotificationScreen(), settings);

      case Routes.onboardingScreen:
        return _buildRoute(const OnboardingScreen(), settings);

      case Routes.tripScreen:
        return _buildRoute(const Tripscreen(), settings);

      case Routes.profileScreen:
        return _buildRoute(const ProfileScreen(), settings);

      case Routes.bottomNavBar:
        return _buildRoute(const BottomNavBar(), settings);

      case Routes.paymentSreen:
        final arguments = settings.arguments as Map<String, String>;
        return _buildRoute(
            BlocProvider(
              create: (context) => RequestCubit(),
              child: Paymentscreen(
                arguments: arguments,
              ),
            ),
            settings);

      case Routes.endScreen:
        return _buildRoute(const Endpag(), settings);

      case Routes.trackLocation:
        return _buildRoute(const TrackLocation(), settings);

      case Routes.driversScreen:
        final arguments = settings.arguments
            as Map<String, String>; // استخرج اسم السيارة من arguments
        return _buildRoute(
            DriversScreen(
              arguments: arguments,
            ),
            settings);

      default:
        return null;
    }
  }

  PageRouteBuilder _buildRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // استخدام AnimationTween مع الترانزيشن الجديد
        var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        );

        var scaleAnimation = Tween(begin: 0.8, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOut),
        );

        var rotateAnimation = Tween(begin: 0.1, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOut),
        );

        return FadeTransition(
          opacity: fadeAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: RotationTransition(
              turns: rotateAnimation,
              child: child,
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 600),
      settings: settings,
    );
  }

}
