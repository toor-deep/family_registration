// Family Member Controller
// File: view_controller/family_member_controller.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FamilyMemberController {
  final formKey = GlobalKey<FormState>();

  // Personal Info
  final TextEditingController firstName = TextEditingController();
  final TextEditingController middleName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController relation = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController maritalStatus = TextEditingController();
  final TextEditingController occupation = TextEditingController();
  final TextEditingController qualification = TextEditingController();
  final TextEditingController bloodGroup = TextEditingController();
  final TextEditingController age = TextEditingController();
  XFile? profilePhoto;


  // Contact Info
  final TextEditingController phone = TextEditingController();
  final TextEditingController altPhone = TextEditingController();
  final TextEditingController landline = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController social = TextEditingController();

  // Address Info
  final TextEditingController flat = TextEditingController();
  final TextEditingController building = TextEditingController();
  final TextEditingController doorNumber = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController landmark = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController district = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController nativeCity = TextEditingController();
  final TextEditingController nativeState = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController pincode = TextEditingController();


  void dispose() {
    firstName.dispose(); lastName.dispose(); relation.dispose(); dob.dispose();
    gender.dispose(); maritalStatus.dispose(); occupation.dispose(); qualification.dispose(); bloodGroup.dispose();
    phone.dispose(); email.dispose();
    flat.dispose(); building.dispose(); street.dispose(); landmark.dispose();
    city.dispose(); district.dispose(); state.dispose(); nativeCity.dispose(); nativeState.dispose();
    country.dispose(); pincode.dispose();
    age.dispose();
    middleName.dispose();
    doorNumber.dispose();
  }
}



