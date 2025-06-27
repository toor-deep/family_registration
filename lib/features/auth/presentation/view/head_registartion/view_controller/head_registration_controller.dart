// Head Registration Controller
// File: view_controller/head_registration_controller.dart
import 'package:flutter/material.dart';

class HeadRegistrationController {
  final formKey = GlobalKey<FormState>();

  // Profile Summary
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController maritalStatus = TextEditingController();
  final TextEditingController occupation = TextEditingController();
  final TextEditingController samajName = TextEditingController();
  final TextEditingController qualification = TextEditingController();

  // Personal Info
  final TextEditingController dob = TextEditingController();
  final TextEditingController bloodGroup = TextEditingController();
  final TextEditingController duties = TextEditingController();

  // Contact Info
  final TextEditingController phone = TextEditingController();
  final TextEditingController altPhone = TextEditingController();
  final TextEditingController landline = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController social = TextEditingController();

  // Address Info
  final TextEditingController flat = TextEditingController();
  final TextEditingController building = TextEditingController();
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
    name.dispose(); age.dispose(); gender.dispose(); maritalStatus.dispose();
    occupation.dispose(); samajName.dispose(); qualification.dispose();
    dob.dispose(); bloodGroup.dispose(); duties.dispose();
    phone.dispose(); altPhone.dispose(); landline.dispose(); email.dispose(); social.dispose();
    flat.dispose(); building.dispose(); street.dispose(); landmark.dispose();
    city.dispose(); district.dispose(); state.dispose(); nativeCity.dispose(); nativeState.dispose();
    country.dispose(); pincode.dispose();
  }
}










