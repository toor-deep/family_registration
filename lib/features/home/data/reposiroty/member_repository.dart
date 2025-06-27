import '../../../auth/domain/entity/head_auth_model.dart';
import '../../domain/entity/member_entity.dart';

abstract class MemberRepository {
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