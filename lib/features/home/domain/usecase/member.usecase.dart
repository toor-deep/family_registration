import 'package:untitled/features/home/data/reposiroty/member_repository.dart';

import '../../../auth/domain/entity/head_auth_model.dart';
import '../../domain/entity/member_entity.dart';

class MemberUseCase {
  final MemberRepository memberRepository;

  MemberUseCase({
    required this.memberRepository,
  });

  Future<String> memberRegistration(
      {required String headId, required FamilyMemberModel memberModel}) {
    return memberRepository.memberRegistration(
      headId: headId,
      memberModel: memberModel,
    );
  }
  Future<HeadAuthModel> getHead(String headId){
    return memberRepository.getHead(headId);
  }

  Stream<List<FamilyMemberModel>> getMembers(String headId){
    return memberRepository.getMembers(headId);
  }

  Future<void> updateMember({required String headId, required FamilyMemberModel memberModel}) {
    return memberRepository.updateMember(
      headId: headId,
      memberModel: memberModel,
    );
  }
}
