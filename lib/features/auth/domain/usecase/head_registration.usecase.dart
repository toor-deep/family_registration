import 'package:untitled/features/auth/data/repository/head_registration_repository.dart';

import '../entity/head_auth_model.dart';

class HeadRegistrationUseCase{
  final HeadRegistrationRepository headRegistrationRepository;
  HeadRegistrationUseCase({
    required this.headRegistrationRepository,
  });

  Future<String> headRegistration({required HeadAuthModel headAuthModel}){
    return headRegistrationRepository.headRegistration(headAuthModel: headAuthModel);
  }

}