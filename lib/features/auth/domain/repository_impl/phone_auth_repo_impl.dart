import 'package:untitled/features/auth/data/data_sources/phone_auth_data_source.dart';
import 'package:untitled/features/auth/data/repository/phone_auth_repository.dart';

class   PhoneAuthRepoImpl implements PhoneAuthRepository {
  final PhoneAuthDataSource remoteDataSource;

  const PhoneAuthRepoImpl({
    required this.remoteDataSource,
  });

  @override
  Future<String> sendVerificationCode({required String phoneNumber}) {
    return remoteDataSource.sendVerificationCode(phoneNumber: phoneNumber);
  }


  @override
  Future<void> verifyCode({required String verificationId, required String smsCode}) {
  return remoteDataSource.verifyCode(verificationId: verificationId, smsCode: smsCode);
  }

  @override
  Future<void> signOut() {
   return remoteDataSource.signOut();
  }

}