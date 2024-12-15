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

  Future<void> simulateRide({
    required String uid,
    required String from,
    required String to,
    required String price,
    required Duration duration,
    required String time,
    required String dis,
  }) async {
    emit(RequestLoading());
    try {
      // الحصول على التاريخ والوقت الحالي
      final DateTime now = DateTime.now();

      // إنشاء بيانات الرحلة
      Map<String, dynamic> rideData = {
        'uid': uid,
        'from': from,
        'to': to,
        'price': price,
        'status': 'جارية', // الحالة الأولية
        'date': now.toIso8601String(), // حفظ التاريخ والوقت معًا
        'startTime': now.toIso8601String(), // حفظ الوقت كبداية للرحلة
        'dis': dis,
        'time': time,
      };

      // إضافة الرحلة إلى Firestore
      DocumentReference rideRef =
          await _firestore.collection('rides').add(rideData);

      emit(RideSavedState(message: 'تمت إضافة الرحلة بنجاح!'));

      // تغيير الحالة إلى "مكتملة" بعد انتهاء المدة المحددة
      Future.delayed(duration, () async {
        try {
          await rideRef.update({
            'status': 'مكتملة', // تحديث الحالة
            'endTime': FieldValue.serverTimestamp(), // تسجيل وقت الانتهاء
          });
          emit(RideUpdatedState(message: 'تم تحديث حالة الرحلة إلى مكتملة.'));
        } catch (e) {
          emit(RequestError(message: 'حدث خطأ أثناء تحديث حالة الرحلة: $e'));
        }
      });
    } catch (e) {
      emit(RequestError(message: 'حدث خطأ أثناء حفظ الرحلة: $e'));
    }
  }


}
