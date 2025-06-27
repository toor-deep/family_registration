import 'package:untitled/features/auth/data/data_sources/head_registration_data_source.dart';
import 'package:untitled/features/auth/domain/entity/head_auth_model.dart';

import '../../data/repository/head_registration_repository.dart';

class HeadRegistrationRepositoryImpl
    implements HeadRegistrationRepository {
  final HeadRegistrationDataSource remoteDataSource;

  HeadRegistrationRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<String> headRegistration({required HeadAuthModel headAuthModel}) {
    return remoteDataSource.headRegistration(headAuthModel: headAuthModel);
  }


}