part of 'request_cubit.dart';

@immutable
sealed class RequestState {}

class RequestInitial extends RequestState {}

class RequestLoading extends RequestState {}

class CarSelectionState extends RequestState {
  final List<CarModel> cars;

  CarSelectionState({required this.cars});
}

class DriverSelectionState extends RequestState {
  final List<DriverModel> drivers;

  DriverSelectionState({required this.drivers});
}

class RequestError extends RequestState {
  final String message;

  RequestError({required this.message});
}
