import 'package:get_it/get_it.dart';
import 'package:untitled/features/auth/data/data_sources/head_registration_data_source.dart';
import 'package:untitled/features/auth/data/data_sources/phone_auth_data_source.dart';
import 'package:untitled/features/auth/domain/repository_impl/head_regustration_repo_impl.dart';
import 'package:untitled/features/auth/domain/repository_impl/phone_auth_repo_impl.dart';
import 'package:untitled/features/auth/domain/usecase/phone_auth.usecase.dart';
import 'package:untitled/features/home/data/data_source/member_data_source.dart';
import 'package:untitled/features/home/domain/repository_impl/member_repository_impl.dart';
import 'package:untitled/features/home/domain/usecase/member.usecase.dart';

import '../../features/auth/domain/usecase/head_registration.usecase.dart';

final getIt = GetIt.instance;

void injectDependencies(){
  //datasources
getIt.registerSingleton(PhoneAuthDataSourceImpl());
getIt.registerSingleton(HeadRegistrationDataSourceImpl());
getIt.registerSingleton(MemberDataSourceImpl());

//repositories
getIt.registerSingleton(PhoneAuthRepoImpl(remoteDataSource: getIt<PhoneAuthDataSourceImpl>()));
getIt.registerSingleton(MemberRepositoryImpl(remoteDataSource: getIt<MemberDataSourceImpl>()));
getIt.registerSingleton(HeadRegistrationRepositoryImpl(remoteDataSource: getIt<HeadRegistrationDataSourceImpl>()));

//usecases
  getIt.registerSingleton(PhoneAuthUseCase(repository: getIt<PhoneAuthRepoImpl>()));
  getIt.registerSingleton(MemberUseCase(memberRepository: getIt<MemberRepositoryImpl>()));
  getIt.registerSingleton(HeadRegistrationUseCase(headRegistrationRepository: getIt<HeadRegistrationRepositoryImpl>()));


  //repositories
}