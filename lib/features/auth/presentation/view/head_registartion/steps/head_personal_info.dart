import 'package:flutter/cupertino.dart';

import '../../../../../../shared/dimensions.dart';
import '../../../../../../shared/widgets/text_form_field.dart';
import '../view_controller/head_registration_controller.dart';

class HeadPersonalInfoStep extends StatelessWidget {
  final HeadRegistrationController controller;
  const HeadPersonalInfoStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Spacing.hmed,

          CommonTextField(controller: controller.dob, label: 'Date of Birth'),
          CommonTextField(controller: controller.bloodGroup, label: 'Blood Group'),
          CommonTextField(controller: controller.duties, label: 'Exact Nature of Duties'),
        ],
      ),
    );
  }
}