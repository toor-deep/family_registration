import '../../domain/entity/head_auth_model.dart';

abstract class HeadRegistrationRepository {
  Future<String> headRegistration({required HeadAuthModel headAuthModel});

}