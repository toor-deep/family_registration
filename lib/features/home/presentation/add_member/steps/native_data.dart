import 'package:flutter/cupertino.dart';

import '../../../../../shared/dimensions.dart';
import '../../../../../shared/widgets/text_form_field.dart';
import '../view_controller/add_member_controllers.dart';

class MemberNativeInfoStep extends StatelessWidget {
  final FamilyMemberController controller;
  const MemberNativeInfoStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Spacing.hmed,
          CommonTextField(controller: controller.nativeState, label: 'Native State'),

          CommonTextField(controller: controller.nativeCity, label: 'Native City'),

        ],
      ),
    );
  }
}
