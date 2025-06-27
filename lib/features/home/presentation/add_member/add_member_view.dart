import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/design-system/app_colors.dart';
import 'package:untitled/features/home/presentation/add_member/steps/address_info.dart';
import 'package:untitled/features/home/presentation/add_member/steps/contact_info.dart';
import 'package:untitled/features/home/presentation/add_member/steps/native_data.dart';
import 'package:untitled/features/home/presentation/add_member/steps/personal_info.dart';
import 'package:untitled/features/home/presentation/add_member/view_controller/add_member_controllers.dart';
import 'package:untitled/features/home/presentation/cubit/member_cubit.dart';
import 'package:untitled/features/home/presentation/cubit/member_state.dart';

import '../../domain/entity/member_entity.dart';
import '../../home_page.dart';

class AddFamilyMemberView extends StatefulWidget {
  static const path = '/add-family';
  static const name = 'add-family';
  final AddMemberArgs addMemberArgs;

  const AddFamilyMemberView({super.key, required this.addMemberArgs});

  @override
  State<AddFamilyMemberView> createState() => _AddFamilyMemberViewState();
}

class _AddFamilyMemberViewState extends State<AddFamilyMemberView> {
  final controller = FamilyMemberController();
  int _currentStep = 0;
  late MemberCubit memberCubit;
  final steps = const ['Personal', 'Contact', 'Address', 'Native Place'];

  @override
  void initState() {
    super.initState();
    memberCubit = BlocProvider.of<MemberCubit>(context);

    final member = widget.addMemberArgs.member;
    if (member != null) {
      controller.firstName.text = member.firstName;
      controller.middleName.text = member.middleName ?? '';
      controller.lastName.text = member.lastName;
      controller.relation.text = member.relation;
      controller.dob.text = member.dob;
      controller.gender.text = member.gender;
      controller.age.text = member.age;
      controller.maritalStatus.text = member.maritalStatus;
      controller.occupation.text = member.occupation;
      controller.qualification.text = member.qualification;
      controller.bloodGroup.text = member.bloodGroup;

      controller.phone.text = member.phone;
      controller.altPhone.text = member.altPhone;
      controller.landline.text = member.landline;
      controller.email.text = member.email;
      controller.social.text = member.social;

      controller.flat.text = member.flat;
      controller.building.text = member.building;
      controller.doorNumber.text = member.doorNumber;
      controller.street.text = member.street;
      controller.landmark.text = member.landmark;
      controller.city.text = member.city;
      controller.district.text = member.district;
      controller.state.text = member.state;
      controller.nativeCity.text = member.nativeCity;
      controller.nativeState.text = member.nativeState;
      controller.country.text = member.country;
      controller.pincode.text = member.pincode;
    }
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
    final model = FamilyMemberModel(
      id: '${widget.addMemberArgs.headId}_${DateTime.now().millisecondsSinceEpoch}',
      firstName: controller.firstName.text,
      middleName: controller.middleName.text,
      lastName: controller.lastName.text,
      relation: controller.relation.text,
      dob: controller.dob.text,
      gender: controller.gender.text,
      maritalStatus: controller.maritalStatus.text,
      occupation: controller.occupation.text,
      qualification: controller.qualification.text,
      bloodGroup: controller.bloodGroup.text,
      age: controller.age.text,
      photoUrl: controller.profilePhoto?.path,
      phone: controller.phone.text,
      altPhone: controller.altPhone.text,
      landline: controller.landline.text,
      email: controller.email.text,
      social: controller.social.text,
      flat: controller.flat.text,
      building: controller.building.text,
      doorNumber: controller.doorNumber.text,
      street: controller.street.text,
      landmark: controller.landmark.text,
      city: controller.city.text,
      district: controller.district.text,
      state: controller.state.text,
      nativeCity: controller.nativeCity.text,
      nativeState: controller.nativeState.text,
      country: controller.country.text,
      pincode: controller.pincode.text,

    );

    if (widget.addMemberArgs.member != null) {
      memberCubit.updateMember(
        headId: widget.addMemberArgs.headId,
        memberModel: model.copyWith(id: widget.addMemberArgs.member?.id),
        onSuccess: (model) {
          context.pushNamed(HomeView.name, extra: widget.addMemberArgs.headId);
        },
      );
    }
    else {
      memberCubit.registerMember(
        headId: widget.addMemberArgs.headId,
        memberModel: model,
        onSuccess: (model) {
          context.pushNamed(HomeView.name, extra: widget.addMemberArgs.headId);
        },
      );
    }
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
        return MemberPersonalInfoStep(controller: controller);
      case 1:
        return MemberContactInfoStep(controller: controller);
      case 2:
        return MemberAddressInfoStep(controller: controller);
      case 3:
        return MemberNativeInfoStep(controller: controller);
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
    return BlocBuilder<MemberCubit, MemberState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Add Family Member',
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
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor),
                        child: _currentStep == steps.length - 1
                            ? (state.isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                        color: Colors.white, strokeWidth: 2),
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

class AddMemberArgs {
  final String headId;
  final FamilyMemberModel? member;

  const AddMemberArgs({
    required this.headId,
    this.member,
  });
}
