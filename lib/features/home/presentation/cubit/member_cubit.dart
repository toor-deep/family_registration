import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/features/home/domain/usecase/member.usecase.dart';
import 'package:untitled/features/home/presentation/cubit/member_state.dart';
import 'package:untitled/shared/toast_alert.dart';
import '../../../auth/domain/entity/head_auth_model.dart';
import '../../domain/entity/member_entity.dart';

class MemberCubit extends Cubit<MemberState> {
  final MemberUseCase memberUseCase;

  MemberCubit({required this.memberUseCase}) : super(const MemberState());

  Future<void> registerMember({
    required String headId,
    required FamilyMemberModel memberModel,
    XFile? profilePhoto,
    required Function(FamilyMemberModel) onSuccess,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      String? uploadedUrl;

      if (profilePhoto != null) {
        uploadedUrl = await uploadImageToFirebase(profilePhoto);
      }

      final updatedModel = memberModel.copyWith(photoUrl: uploadedUrl);

      await memberUseCase.memberRegistration(
        headId: headId,
        memberModel: updatedModel,
      );

      onSuccess(updatedModel);
      showSnackbar('Family Member added successfully', Colors.green);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      showSnackbar(e.toString(), Colors.red);
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> updateMember({
    required String headId,
    required FamilyMemberModel memberModel,
    XFile? profilePhoto,
    required Function(FamilyMemberModel) onSuccess,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      String? uploadedUrl;

      if (profilePhoto != null) {
        uploadedUrl = await uploadImageToFirebase(profilePhoto);
      }

      final updatedModel = memberModel.copyWith(photoUrl: uploadedUrl ?? memberModel.photoUrl);

      await memberUseCase.updateMember(
        headId: headId,
        memberModel: updatedModel,
      );

      onSuccess(updatedModel);
      showSnackbar('Member updated successfully', Colors.green);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      showSnackbar('Update failed: $e', Colors.red);
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<HeadAuthModel?> getHead(String headId) async {
    try {
      return await memberUseCase.getHead(headId);
    } catch (e) {
      emit(state.copyWith(error: 'Failed to fetch head: $e'));
      return null;
    }
  }

  Stream<List<FamilyMemberModel>> getMembers(String headId) {
    return memberUseCase.getMembers(headId);
  }

  Future<String> uploadImageToFirebase(XFile file) async {
    final storageRef = FirebaseStorage.instance.ref();
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final imageRef = storageRef.child('profile_photos/$fileName.jpg');

    await imageRef.putFile(File(file.path));
    return await imageRef.getDownloadURL();
  }
}
