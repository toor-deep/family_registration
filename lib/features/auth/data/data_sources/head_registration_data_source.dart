import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/api/api_url.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entity/head_auth_model.dart';

abstract class HeadRegistrationDataSource {
Future<String> headRegistration({required HeadAuthModel headAuthModel});
}


class HeadRegistrationDataSourceImpl implements HeadRegistrationDataSource {

  HeadRegistrationDataSourceImpl();

  @override
  Future<String> headRegistration({required HeadAuthModel headAuthModel}) async {
    try {
      final response=await ApiUrl.headUsers.add(headAuthModel.toMap());
      print('id is ${response.id}');
      return response.id;
    } catch (e) {
      throw GenericFailure(message: 'Failed to register head: ${e.toString()}');
    }
  }
}
