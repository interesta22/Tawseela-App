import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  AuthCubit() : super(AuthInitial());

  void checkAuthStatus() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user != null) {
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    });
  }

  Future<void> sendOtp(String phoneNumber) async {
    if (phoneNumber.length != 10) {
      emit(AuthError("Invalid phone number. Must be 10 digits."));
      return;
    }

    emit(AuthLoading());

    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+20$phoneNumber', // تأكد من إضافة رمز الدولة مسبقًا
        verificationCompleted: (PhoneAuthCredential credential) async {

          // يمكن إضافة تسجيل دخول مباشر إذا اكتمل التحقق تلقائيًا
        },
        verificationFailed: (FirebaseAuthException e) {
        },
        codeSent: (String verificationId, int? resendToken) {
          emit(AuthCodeSent(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          emit(AuthError('Code retrieval timed out'));
        },
        // إضافة خاصية reCAPTCHA للتحقق من الروبوت
        forceResendingToken: null,
      );
    } catch (e) {
    }
  }

  Future<void> verifyOtp(String otp, String verificationId) async {
    emit(AuthLoading());
    const String correctOtp = "123456";
    if (otp == correctOtp) {
      emit(AuthVerified());
    } else {
      emit(AuthError("Invalid OTP"));
    }
  }

  Future<void> signup({
    required String email,
    required String password,
    required String name,
    required String governorate,
    required String phoneNumber,
  }) async {
    emit(AuthLoading());
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // حفظ بيانات المستخدم في قاعدة البيانات
      await firestore.collection('users').doc(credential.user!.uid).set({
        'name': name,
        'email': email,
        'phone': '+20$phoneNumber',
        'governorate': governorate,
        'password': password,
      });

      emit(Authenticated());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message.toString()));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
  Future<User?> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      // Attempt to log in using Firebase Auth
      UserCredential credential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Successful login, save login status to SharedPreferences
      emit(Authenticated());

      return credential.user;
    } on FirebaseAuthException catch (e) {
      emit(Unauthenticated(errorMessage: e.message.toString()));
    }
    return null;
  }


  Future<void> logout() async {
    emit(AuthLoading());
    await _firebaseAuth.signOut();
    emit(Unauthenticated());
  }
}
