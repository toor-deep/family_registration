import 'package:untitled/features/home/domain/entity/member_entity.dart';

class MemberState {
  final String? error;
  final bool isLoading;
  final List<FamilyMemberModel> members;

  const MemberState({
    this.error,
    this.isLoading = false,
    this.members = const [],
  });

  MemberState copyWith({
    String? error,
    bool? isLoading,
    List<FamilyMemberModel>? members,
  }) {
    return MemberState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      members: members ?? this.members,
    );
  }
}