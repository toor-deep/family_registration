import 'package:untitled/features/auth/data/repository/phone_auth_repository.dart';

class PhoneAuthUseCase {
  final PhoneAuthRepository repository;

  PhoneAuthUseCase({required this.repository});

  Future<String> sendVerificationCode({
    required String phoneNumber,
  }) {
    return repository.sendVerificationCode(phoneNumber: phoneNumber);
  }

  Future<void> verifyCode({
    required String verificationId,
    required String smsCode,
  }) {
    return repository.verifyCode(
        verificationId: verificationId, smsCode: smsCode);
  }

  Future<void> signOut() {
    return repository.signOut();
  }
}
