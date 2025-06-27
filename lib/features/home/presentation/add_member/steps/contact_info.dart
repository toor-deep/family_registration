import 'package:flutter/cupertino.dart';

import '../../../../../shared/dimensions.dart';
import '../../../../../shared/widgets/text_form_field.dart';
import '../view_controller/add_member_controllers.dart';

class MemberContactInfoStep extends StatelessWidget {
  final FamilyMemberController controller;
  const MemberContactInfoStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Spacing.hmed,
          CommonTextField(controller: controller.phone, label: 'Phone Number'),
          CommonTextField(controller: controller.altPhone, label: 'Alternative Number'),
          CommonTextField(controller: controller.landline, label: 'Landline Number'),
          CommonTextField(controller: controller.email, label: 'Email ID'),
          CommonTextField(controller: controller.social, label: 'Social Media Link'),
        ],
      ),
    );
  }
}
