import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../shared/dimensions.dart';
import '../../../../../shared/widgets/text_form_field.dart';
import '../view_controller/add_member_controllers.dart';

class MemberPersonalInfoStep extends StatefulWidget {
  final FamilyMemberController controller;

  const MemberPersonalInfoStep({super.key, required this.controller});

  @override
  State<MemberPersonalInfoStep> createState() => _MemberPersonalInfoStepState();
}

class _MemberPersonalInfoStepState extends State<MemberPersonalInfoStep> {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedFile;

  Future<void> _pickPhoto() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _pickedFile = picked);
      widget.controller.profilePhoto = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Spacing.hmed,
          GestureDetector(
            onTap: _pickPhoto,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade200,
              backgroundImage:
              _pickedFile != null ? FileImage(File(_pickedFile!.path)) : null,
              child: _pickedFile == null
                  ? const Icon(Icons.camera_alt, size: 32, color: Colors.grey)
                  : null,
            ),
          ),
          SizedBox(height: 16),
          CommonTextField(controller: widget.controller.firstName, label: 'First Name'),
          CommonTextField(controller: widget.controller.middleName, label: 'Middle Name'),
          CommonTextField(controller: widget.controller.lastName, label: 'Last Name'),
          CommonTextField(controller: widget.controller.relation, label: 'Relation to Head'),
          CommonTextField(controller: widget.controller.dob, label: 'Date of Birth'),
          CommonTextField(controller: widget.controller.age, label: 'Age', keyboardType: TextInputType.number),
          CommonTextField(controller: widget.controller.gender, label: 'Gender'),
          CommonTextField(controller: widget.controller.maritalStatus, label: 'Marital Status'),
          CommonTextField(controller: widget.controller.occupation, label: 'Occupation'),
          CommonTextField(controller: widget.controller.qualification, label: 'Qualification'),
          CommonTextField(controller: widget.controller.bloodGroup, label: 'Blood Group'),
        ],
      ),
    );
  }
}
