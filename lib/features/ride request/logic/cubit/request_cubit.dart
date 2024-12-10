import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tewseela_app/features/ride%20request/data/car_model.dart';
import 'package:tewseela_app/features/ride%20request/data/driver_model.dart';
part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestInitial());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchCars() async {
    emit(RequestLoading());
    try {
      // Fetch cars from Firebase
      final carsSnapshot = await _firestore.collection('cars').get();
      List<CarModel> cars = carsSnapshot.docs.map((doc) => CarModel.fromFirestore(doc)).toList();
      print('Price: ${cars[0].price} - Type: ${cars[0].price.runtimeType}');
      emit(CarSelectionState(cars: cars));
    } catch (e) {
      emit(RequestError(message: 'Failed to load cars: $e'));
    }
  }

  Future<void> fetchDrivers(String carName) async {
    emit(RequestLoading());
    try {
      // Fetch drivers from Firebase based on selectedCar
      final driversSnapshot = await _firestore.collection('drivers').where('car', isEqualTo: carName).get();
      List<DriverModel> drivers = driversSnapshot.docs
          .map((doc) => DriverModel.fromFirestore(doc))
          .toList();
      emit(DriverSelectionState(drivers: drivers));
    } catch (e) {
      emit(RequestError(message: 'Failed to load drivers: $e'));
    }
  }
}
