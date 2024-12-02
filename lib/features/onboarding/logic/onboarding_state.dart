part of 'onboarding_cubit.dart';

sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingLoading extends OnboardingState {}

final class OnboardingSeen extends OnboardingState {}

final class OnboardingNotSeen extends OnboardingState {}
