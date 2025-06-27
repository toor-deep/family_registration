
abstract class PhoneAuthRepository {

  Future<String> sendVerificationCode({
    required String phoneNumber,
  });

  Future<void> verifyCode({
    required String verificationId,
    required String smsCode,
  });

  Future<void> signOut();
}