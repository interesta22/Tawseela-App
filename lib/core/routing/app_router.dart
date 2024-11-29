import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/features/auth/ui/screens/otp.dart';
import 'package:tewseela_app/features/home/ui/screens/home.dart';
import 'package:tewseela_app/features/auth/ui/screens/phone.dart';
import 'package:tewseela_app/features/auth/ui/screens/login.dart';
import 'package:tewseela_app/features/auth/ui/screens/sign_up.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.onBoardingScreen:
      //   return _buildRoute(const OnboardingScreen(), settings);
      case Routes.phoneScreen:
        return _buildRoute(PhoneAuthScreen(), settings);

      case Routes.otpScreen:
        return _buildRoute(OtpScreen(), settings);

      case Routes.signupScreen:
        return _buildRoute(SignupScreen(), settings); // Use fade transition here

      case Routes.loginScreen:
        return _buildRoute(const LoginScreen(), settings);

      case Routes.homeScreen:
        return _buildRoute(const HomeScreen(), settings); // Use fade transition here

      default:
        return null;
    }
  }

  PageRouteBuilder _buildRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
              .animate(animation),
          child: FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
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
