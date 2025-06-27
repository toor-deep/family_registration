import 'package:flutter/cupertino.dart';

import '../../../../../../shared/dimensions.dart';
import '../../../../../../shared/widgets/text_form_field.dart';
import '../view_controller/head_registration_controller.dart';

class HeadProfileSummaryStep extends StatelessWidget {
  final HeadRegistrationController controller;
  const HeadProfileSummaryStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Spacing.hmed,

          CommonTextField(controller: controller.name, label: 'Name'),
          CommonTextField(controller: controller.age, label: 'Age', keyboardType: TextInputType.number),
          CommonTextField(controller: controller.gender, label: 'Gender'),
          CommonTextField(controller: controller.maritalStatus, label: 'Marital Status'),
          CommonTextField(controller: controller.occupation, label: 'Occupation'),
          CommonTextField(controller: controller.samajName, label: 'Samaj Name'),
          CommonTextField(controller: controller.qualification, label: 'Qualification'),
        ],
      ),
    );
  }
}