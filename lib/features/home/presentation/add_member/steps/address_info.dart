import 'package:flutter/cupertino.dart';
import 'package:untitled/shared/dimensions.dart';

import '../../../../../shared/widgets/text_form_field.dart';
import '../view_controller/add_member_controllers.dart';

class MemberAddressInfoStep extends StatelessWidget {
  final FamilyMemberController controller;
  const MemberAddressInfoStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Spacing.hmed,
          CommonTextField(controller: controller.flat, label: 'Flat Number'),
          CommonTextField(controller: controller.building, label: 'Building Name'),
          CommonTextField(controller: controller.doorNumber, label: 'Door Number'),
          CommonTextField(controller: controller.street, label: 'Street'),
          CommonTextField(controller: controller.landmark, label: 'Landmark'),
          CommonTextField(controller: controller.city, label: 'City'),
          CommonTextField(controller: controller.district, label: 'District'),
          CommonTextField(controller: controller.state, label: 'State'),
          CommonTextField(controller: controller.country, label: 'Country'),
          CommonTextField(controller: controller.pincode, label: 'Pincode', keyboardType: TextInputType.number),
        ],
      ),
    );
  }
}
