import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'onboarding_state.dart';




class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  Future<void> checkOnboardingSeen() async {
    emit(OnboardingLoading());
    await Future.delayed(const Duration(seconds: 4));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final completed = prefs.getBool('onboarding_seen') ?? false;
    emit(completed ? OnboardingSeen() : OnboardingNotSeen());
  }

  Future<void> onboardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboarding_seen', true);
    emit(OnboardingSeen());
  }
}
