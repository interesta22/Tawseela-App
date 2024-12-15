import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  TripCubit() : super(TripInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// جلب الرحلة الجارية للمستخدم الحالي
  Future<void> fetchCurrentTrip({required String uid}) async {
    try {
      emit(TripLoading());

      // التحقق من `uid`
      if (uid.isEmpty) {
        emit(TripError('لا يوجد مستخدم مسجل دخول.'));
        return;
      }

      // جلب بيانات الرحلة الجارية
      var tripSnapshot = await _firestore
          .collection('rides')
          .where('uid', isEqualTo: uid)
          .where('status', isEqualTo: 'جارية')
          .limit(1)
          .get();

      if (tripSnapshot.docs.isNotEmpty) {
        var tripData = tripSnapshot.docs.first.data();
        emit(TripLoaded(tripData)); // إرسال البيانات للحالة
      } else {
        emit(TripError('لا توجد رحلات جارية لهذا المستخدم.'));
      }
    } catch (e) {
      emit(TripError('حدث خطأ أثناء جلب البيانات: ${e.toString()}'));
    }
  }

  /// جلب جميع الرحلات للمستخدم
  Future<void> fetchAllTrips({required String uid}) async {
    try {
      emit(TripLoading());

      // التحقق من `uid`
      if (uid.isEmpty) {
        emit(TripError('لا يوجد مستخدم مسجل دخول.'));
        return;
      }

      // جلب جميع الرحلات
      var tripsSnapshot = await _firestore
          .collection('rides')
          .where('uid', isEqualTo: uid)
          .get();

      if (tripsSnapshot.docs.isNotEmpty) {
        // تحويل البيانات إلى قائمة
        List<Map<String, dynamic>> tripsData = tripsSnapshot.docs.map((doc) {
          return doc.data();
        }).toList();

        emit(TripsLoaded(tripsData)); // إرسال قائمة الرحلات
      } else {
        emit(TripError('لا توجد رحلات لهذا المستخدم.'));
      }
    } catch (e) {
      emit(TripError('حدث خطأ أثناء جلب البيانات: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    // يمكنك إضافة أي تنظيف للمؤقتات أو المستمعات هنا
    return super.close();
  }
}
