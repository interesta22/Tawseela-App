import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';


part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthInitial());
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // إرسال OTP
  Future<void> sendOtp(String phoneNumber) async {
    emit(PhoneAuthVerifying());

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // في حالة التحقق التلقائي عبر الرسائل
        await _auth.signInWithCredential(credential);
        emit(PhoneAuthVerified());
      },
      verificationFailed: (e) {
        // إذا فشل التحقق
        emit(PhoneAuthError());
      },
      codeSent: (verificationId, resendToken) {
        // إرسال رمز التحقق
        // احفظ verificationId لاستخدامه لاحقاً
      },
      codeAutoRetrievalTimeout: (verificationId) {
        // عند انتهاء الوقت
      },
    );
  }

  // التحقق من OTP
  Future<void> verifyOtp(String verificationId, String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    try {
      await _auth.signInWithCredential(credential);
      emit(PhoneAuthVerified());
    } catch (e) {
      emit(PhoneAuthError());
    }
  }

  // التحقق مما إذا كان الرقم مسجلاً أم لا
  Future<void> checkUser() async {
    final User? user = _auth.currentUser;

    if (user != null) {
      // إذا كان المستخدم مسجلاً مسبقاً
      emit(PhoneAuthVerified());
    } else {
      // إذا كان المستخدم جديد
      emit(PhoneAuthError()); // يمكن تعديلها لتوجيه المستخدم لصفحة التسجيل
    }
  }
}

