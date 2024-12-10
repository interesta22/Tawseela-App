part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthCodeSent extends AuthState {
  final String verificationId;

  AuthCodeSent(this.verificationId);
}

class AuthVerified extends AuthState {}

final class Authenticated extends AuthState {}

// ignore: must_be_immutable
final class Unauthenticated extends AuthState {
  String errorMessage;
  Unauthenticated({this.errorMessage = 'Not user founded'});
}
class AuthSendSuccess extends AuthState {
  final String verificationId;

  AuthSendSuccess(this.verificationId);
}

class AuthResendSuccess extends AuthState {
  final String verificationId;

  AuthResendSuccess(this.verificationId);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
