import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/features/auth/domain/usecase/head_registration.usecase.dart';
import 'package:untitled/features/auth/presentation/cubit/head_auth_cubit/head_registration_state.dart';
import 'package:untitled/shared/toast_alert.dart';

import '../../../domain/entity/head_auth_model.dart';

class HeadRegistrationCubit extends Cubit<HeadRegistrationState> {
  final HeadRegistrationUseCase headRegistrationUseCase;

  HeadRegistrationCubit({
    required this.headRegistrationUseCase,
  }) : super(HeadRegistrationState());

  Future<void> headRegistration(
      {required HeadAuthModel headAuthModel,
      required Function(String) onSuccess}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final response = await headRegistrationUseCase.headRegistration(
          headAuthModel: headAuthModel);
      onSuccess(response);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('headId', response);
      showSnackbar('Registration Successfully', Colors.green);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      showSnackbar(e.toString(), Colors.red);
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
