import 'package:untitled/features/auth/domain/entity/head_auth_model.dart';
import 'package:untitled/features/home/data/data_source/member_data_source.dart';
import 'package:untitled/features/home/domain/entity/member_entity.dart';

import '../../data/reposiroty/member_repository.dart';

class MemberRepositoryImpl implements MemberRepository {
  final MemberDataSource remoteDataSource;

  MemberRepositoryImpl({required this.remoteDataSource});

  @override
  Future<String> memberRegistration(
      {required String headId, required FamilyMemberModel memberModel}) {
    return remoteDataSource.memberRegistration(
      headId: headId,
      memberModel: memberModel,
    );
  }

  @override
  Future<HeadAuthModel> getHead(String headId) {
    return remoteDataSource.getHead(headId);
  }

  @override
  Stream<List<FamilyMemberModel>> getMembers(String headId) {
    return remoteDataSource.getMembers(headId);
  }

  @override
  Future<void> updateMember({required String headId, required FamilyMemberModel memberModel}) {

    return remoteDataSource.updateMember(
      headId: headId,
      memberModel: memberModel,
    );
  }
}
