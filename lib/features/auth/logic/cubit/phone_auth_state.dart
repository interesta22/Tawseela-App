part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class PhoneAuthVerifying extends PhoneAuthState {}

final class PhoneAuthVerified extends PhoneAuthState {}

final class PhoneAuthError extends PhoneAuthState {}
