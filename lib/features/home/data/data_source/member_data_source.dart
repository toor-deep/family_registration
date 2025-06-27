import 'package:untitled/core/api/api_url.dart';
import 'package:untitled/core/errors/failures.dart';
import 'package:untitled/features/home/domain/entity/member_entity.dart';

import '../../../auth/domain/entity/head_auth_model.dart';

abstract class MemberDataSource {
  Future<String> memberRegistration({
    required String headId,
    required FamilyMemberModel memberModel,
  });
  Future<HeadAuthModel> getHead(String headId);

  Stream<List<FamilyMemberModel>> getMembers(String headId);
  Future<void> updateMember({
    required String headId,
    required FamilyMemberModel memberModel,
  });
}

class MemberDataSourceImpl implements MemberDataSource {
  MemberDataSourceImpl();

  @override
  Future<String> memberRegistration({
    required String headId,
    required FamilyMemberModel memberModel,
  }) async {
    try {
     final response= await ApiUrl.members(headId).add(memberModel.toMap());
     return response.id;
    } catch (e) {
      throw GenericFailure(
          message: 'Failed to register member: ${e.toString()}');
    }
  }
  @override
  Future<HeadAuthModel> getHead(String headId) async {
    try {
      final doc = await ApiUrl.headUsers.doc(headId).get();
      if (!doc.exists) throw GenericFailure(message: 'Head not found');
      return HeadAuthModel.fromMap(doc.data()!);
    } catch (e) {
      throw GenericFailure(message: 'Failed to fetch head: ${e.toString()}');
    }
  }

  @override
  Stream<List<FamilyMemberModel>> getMembers(String headId) {
    return ApiUrl.members(headId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        print('id is ${doc.id}');
        return FamilyMemberModel.fromMap(doc.data() as Map<String, dynamic>,doc.id);
      }).toList();
    });
  }
  @override
  Future<void> updateMember({
    required String headId,
    required FamilyMemberModel memberModel,
  }) async {
    try {
print('member id${memberModel.id}');
      await ApiUrl.members(headId).doc(memberModel.id).update(memberModel.toMap());
    } catch (e) {
      throw GenericFailure(message: 'Failed to update member: ${e.toString()}');
    }
  }

}
