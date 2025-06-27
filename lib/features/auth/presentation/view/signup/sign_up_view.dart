import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/design-system/app_colors.dart';
import 'package:untitled/design-system/styles.dart';
import 'package:untitled/features/auth/presentation/cubit/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:untitled/features/auth/presentation/cubit/phone_auth_cubit/phone_auth_state.dart';

import '../../../../../../shared/dimensions.dart';
import 'otp_view.dart';

class SignupView extends StatefulWidget {
  static const String path = '/signUp';
  static const String name = 'signUp';

  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _phoneController = TextEditingController();
  late PhoneAuthCubit phoneAuthCubit;

  @override
  void initState() {
    phoneAuthCubit = context.read<PhoneAuthCubit>();
    super.initState();
  }

  void _handleSendOtp() {
    final phone = _phoneController.text.trim();

    if (phone.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid phone number')),
      );
      return;
    }
    phoneAuthCubit.sendOtp('+91${_phoneController.text}',(){
      context.pushNamed(OtpView.name, extra: _phoneController.text);

    });

  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: Paddings.contentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 150.h),
                  Align(
                    alignment: Alignment.center,
                    child: const Text(
                      'Create Account',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: const Text(
                      'Enter your phone number to sign up',
                      style: TextStyle(fontSize: 16, color: kPrimaryColor),
                    ),
                  ),
                  SizedBox(height: 40.h),

                  // Phone Input
                  Text(
                    'Phone Number',
                    style: TextStyles.textFormFieldDefaultStyle_14,
                  ),
                  Spacing.hmed,
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'e.g. 9876543210',
                      prefixText: '+91 ',
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: kGreyColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),

                  // Send OTP Button
                  ElevatedButton(
                    onPressed: _handleSendOtp,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: state.isLoading
                        ? CircularProgressIndicator()
                        : const Text('Send OTP'),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
