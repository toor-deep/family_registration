import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';

abstract class PhoneAuthDataSource {
  Future<String> sendVerificationCode({
    required String phoneNumber,
  });

  Future<void> verifyCode({
    required String verificationId,
    required String smsCode,
  });

  Future<void> signOut();
}

class PhoneAuthDataSourceImpl implements PhoneAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<String> sendVerificationCode({
    required String phoneNumber,
  }) async {
    late final String verificationId;

    final completer = Completer<String>();

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        completer.completeError(
          GenericFailure(message: e.message ?? 'Verification failed'),
        );
      },
      codeSent: (String verId, int? resendToken) {
        verificationId = verId;
        completer.complete(verificationId);
      },
      codeAutoRetrievalTimeout: (String verId) {
        if (!completer.isCompleted) {
          completer.complete(verId);
        }
      },
    );

    return completer.future;
  }

  @override
  Future<void> verifyCode({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw GenericFailure(message: e.message ?? 'OTP verification failed');
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
