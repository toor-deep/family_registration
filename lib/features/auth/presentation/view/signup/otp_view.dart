import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/design-system/app_colors.dart';
import 'package:untitled/design-system/styles.dart';
import 'package:untitled/features/auth/presentation/cubit/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:untitled/features/auth/presentation/cubit/phone_auth_cubit/phone_auth_state.dart';

import '../head_registartion/head_registration_main_view.dart';

class OtpView extends StatefulWidget {
  static const String path = '/otp';
  static const String name = 'otp';
  final String phoneNumber;

  const OtpView({super.key, required this.phoneNumber});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  String? _verificationId;
  String _otpCode = '';

  Timer? _timer;
  int _secondsRemaining = 30;
  bool _canResend = false;
  late PhoneAuthCubit phoneAuthCubit;

  @override
  void initState() {
    phoneAuthCubit = context.read<PhoneAuthCubit>();

    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    setState(() {
      _secondsRemaining = 30;
      _canResend = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        setState(() => _canResend = true);
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  void _resendOtp() {
    if (!_canResend) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('OTP resent')),
    );

    _startResendTimer();
  }

  void _verifyOtp() {
    if (_otpCode.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 6-digit OTP')),
      );
      return;
    }
    phoneAuthCubit.verifyOtp(_otpCode, () {
      context.pushNamed(HeadRegistrationView.name, extra: widget.phoneNumber);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Verify OTP')),
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Text(
                  'Enter the 6-digit code sent to',
                  style: TextStyles.textFormFieldDefaultStyle_14,
                ),
                const SizedBox(height: 8),
                Text(
                  '+91 ${widget.phoneNumber}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: 40.h),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: kPrimaryColor,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    setState(() => _otpCode = verificationCode);
                  },
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: _verifyOtp,
                    child: state.isLoading
                        ? CircularProgressIndicator()
                        : const Text('Verify OTP'),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: TextButton(
                    onPressed: _canResend ? _resendOtp : null,
                    child: Text(
                      _canResend
                          ? 'Resend OTP'
                          : 'Resend OTP in $_secondsRemaining sec',
                      style: TextStyle(
                        color: _canResend ? kPrimaryColor : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
