import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/auth/domain/usecase/phone_auth.usecase.dart';
import 'package:untitled/features/auth/presentation/cubit/phone_auth_cubit/phone_auth_state.dart';
import 'package:untitled/shared/toast_alert.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final PhoneAuthUseCase phoneAuthUseCase;

  PhoneAuthCubit({required this.phoneAuthUseCase}) : super(PhoneAuthState());

  void sendOtp(String phoneNumber, Function onSuccess) async {
    emit(state.copyWith(isLoading: true));

    try {
      final verificationId =
      await phoneAuthUseCase.sendVerificationCode(phoneNumber: phoneNumber);
      showSnackbar('OTP sent successfully', Colors.green);
      onSuccess();
      emit(state.copyWith(
        verificationId: verificationId,
        isLoading: false,
      ));
    } catch (e) {
      showSnackbar(e.toString(), Colors.red);

      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  void verifyOtp(String otp, Function onSuccess) async {


    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await phoneAuthUseCase.verifyCode(
        verificationId: state.verificationId!,
        smsCode: otp,
      );
      showSnackbar('OTP verify successfully', Colors.green);

      emit(state.copyWith(isLoading: false));
      onSuccess();
    } catch (e) {
      showSnackbar(e.toString(), Colors.red);

      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void reset() {
    emit(PhoneAuthState());
  }
}
