import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/design-system/app_colors.dart';
import 'package:untitled/features/auth/domain/entity/head_auth_model.dart';
import 'package:untitled/features/auth/presentation/cubit/head_auth_cubit/head_registration_cubit.dart';
import 'package:untitled/features/auth/presentation/cubit/head_auth_cubit/head_registration_state.dart';
import 'package:untitled/features/auth/presentation/view/head_registartion/steps/head_address_info.dart';
import 'package:untitled/features/auth/presentation/view/head_registartion/steps/head_contact_info.dart';
import 'package:untitled/features/auth/presentation/view/head_registartion/steps/head_personal_info.dart';
import 'package:untitled/features/auth/presentation/view/head_registartion/steps/head_profile_summary.dart';
import 'package:untitled/features/auth/presentation/view/head_registartion/view_controller/head_registration_controller.dart';

import '../../../../home/home_page.dart';

class HeadRegistrationView extends StatefulWidget {
  static const path = '/head-registration';
  static const name = 'head-registration';
  final String phoneNumber;

  const HeadRegistrationView({super.key, required this.phoneNumber});

  @override
  State<HeadRegistrationView> createState() => _HeadRegistrationViewState();
}

class _HeadRegistrationViewState extends State<HeadRegistrationView> {
  final controller = HeadRegistrationController();
  int _currentStep = 0;
  late HeadRegistrationCubit headRegistrationCubit;
  final steps = const ['Profile', 'Personal', 'Contact', 'Address'];

  @override
  void initState() {
    headRegistrationCubit = context.read<HeadRegistrationCubit>();
    controller.phone.text = widget.phoneNumber;
    super.initState();
  }

  void _onNext() {
    final isLastStep = _currentStep == steps.length - 1;
    if (controller.formKey.currentState!.validate()) {
      if (isLastStep) {
        submit();
      } else {
        setState(() => _currentStep++);
      }
    }
  }

  void submit() {
    headRegistrationCubit.headRegistration(
      headAuthModel: HeadAuthModel(
        name: controller.name.text,
        age: controller.age.text,
        gender: controller.gender.text,
        maritalStatus: controller.maritalStatus.text,
        occupation: controller.occupation.text,
        samajName: controller.samajName.text,
        qualification: controller.qualification.text,
        dob: controller.dob.text,
        bloodGroup: controller.bloodGroup.text,
        duties: controller.duties.text,
        phone: controller.phone.text,
        altPhone: controller.altPhone.text,
        landline: controller.landline.text,
        email: controller.email.text,
        social: controller.social.text,
        flat: controller.flat.text,
        building: controller.building.text,
        street: controller.street.text,
        landmark: controller.landmark.text,
        city: controller.city.text,
        district: controller.district.text,
        state: controller.state.text,
        nativeCity: controller.nativeCity.text,
        nativeState: controller.nativeState.text,
        country: controller.country.text,
        pincode: controller.pincode.text,
      ),
      onSuccess: (id){
        if(id.isNotEmpty){
        context.pushNamed(HomeView.name,extra: id);}
      }
    );
  }



  void _onBack() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    } else {
      Navigator.pop(context);
    }
  }

  Widget _buildStepHeader() {
    return Row(
      children: List.generate(steps.length * 2 - 1, (index) {
        if (index.isEven) {
          final stepIndex = index ~/ 2;
          final isSelected = stepIndex == _currentStep;
          return GestureDetector(
            onTap: () => setState(() => _currentStep = stepIndex),
            child: Column(
              children: [
                CircleAvatar(
                  radius: isSelected ? 16.r : 14.r,
                  backgroundColor:
                  isSelected ? kPrimaryColor : Colors.grey.shade300,
                  child: Text(
                    '${stepIndex + 1}',
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  steps[stepIndex],
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Expanded(
            child: Divider(
              thickness: 2,
              color: kPrimaryColor.withValues(alpha: 0.3),
              indent: 4.w,
              endIndent: 4.w,
            ),
          );
        }
      }),
    );
  }

  Widget _getStepContent() {
    switch (_currentStep) {
      case 0:
        return HeadProfileSummaryStep(controller: controller);
      case 1:
        return HeadPersonalInfoStep(controller: controller);
      case 2:
        return HeadContactInfoStep(controller: controller);
      case 3:
        return HeadAddressInfoStep(controller: controller);
      default:
        return const SizedBox();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeadRegistrationCubit, HeadRegistrationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'Head Registration',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: kPrimaryColor,
          ),
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStepHeader(),
                  Divider(height: 32.h),
                  Expanded(
                    child: SizedBox(
                      key: ValueKey(_currentStep),
                      width: double.infinity,
                      child: _getStepContent(),
                    ),

                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _onNext,
                        style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                        child: _currentStep == steps.length - 1
                            ? (state.isLoading
                            ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                            : const Text('Submit'))
                            : const Text('Next'),
                      ),
                      const SizedBox(width: 12),
                      if (_currentStep > 0)
                        TextButton(
                          onPressed: _onBack,
                          child: const Text('Back'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
