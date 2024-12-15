part of 'trip_cubit.dart';

@immutable
sealed class TripState {}

final class TripInitial extends TripState {}

class TripLoading extends TripState {}

class TripLoaded extends TripState {
  final Map<String, dynamic> tripData;

  TripLoaded(this.tripData);
}

class TripsLoaded extends TripState {
  final List<Map<String, dynamic>> tripsData;

  TripsLoaded(this.tripsData);
}

class TripError extends TripState {
  final String message;

  TripError(this.message);
}
