import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
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
        initialRoute: Routes.onboardingScreen,
        onGenerateRoute: AppRouter().generateRoute,
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
