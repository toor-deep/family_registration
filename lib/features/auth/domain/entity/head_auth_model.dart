import 'package:equatable/equatable.dart';

class HeadAuthModel extends Equatable {
  // Profile Summary
  final String name;
  final String age;
  final String gender;
  final String maritalStatus;
  final String occupation;
  final String samajName;
  final String qualification;

  // Personal Info
  final String dob;
  final String bloodGroup;
  final String duties;

  // Contact Info
  final String phone;
  final String altPhone;
  final String landline;
  final String email;
  final String social;

  // Address Info
  final String flat;
  final String building;
  final String street;
  final String landmark;
  final String city;
  final String district;
  final String state;
  final String nativeCity;
  final String nativeState;
  final String country;
  final String pincode;


  const HeadAuthModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.maritalStatus,
    required this.occupation,
    required this.samajName,
    required this.qualification,
    required this.dob,
    required this.bloodGroup,
    required this.duties,
    required this.phone,
    required this.altPhone,
    required this.landline,
    required this.email,
    required this.social,
    required this.flat,
    required this.building,
    required this.street,
    required this.landmark,
    required this.city,
    required this.district,
    required this.state,
    required this.nativeCity,
    required this.nativeState,
    required this.country,
    required this.pincode,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'maritalStatus': maritalStatus,
      'occupation': occupation,
      'samajName': samajName,
      'qualification': qualification,
      'dob': dob,
      'bloodGroup': bloodGroup,
      'duties': duties,
      'phone': phone,
      'altPhone': altPhone,
      'landline': landline,
      'email': email,
      'social': social,
      'flat': flat,
      'building': building,
      'street': street,
      'landmark': landmark,
      'city': city,
      'district': district,
      'state': state,
      'nativeCity': nativeCity,
      'nativeState': nativeState,
      'country': country,
      'pincode': pincode,
    };
  }

  factory HeadAuthModel.fromMap(Map<String, dynamic> map) {
    return HeadAuthModel(
      name: map['name'] ?? '',
      age: map['age'] ?? '',
      gender: map['gender'] ?? '',
      maritalStatus: map['maritalStatus'] ?? '',
      occupation: map['occupation'] ?? '',
      samajName: map['samajName'] ?? '',
      qualification: map['qualification'] ?? '',
      dob: map['dob'] ?? '',
      bloodGroup: map['bloodGroup'] ?? '',
      duties: map['duties'] ?? '',
      phone: map['phone'] ?? '',
      altPhone: map['altPhone'] ?? '',
      landline: map['landline'] ?? '',
      email: map['email'] ?? '',
      social: map['social'] ?? '',
      flat: map['flat'] ?? '',
      building: map['building'] ?? '',
      street: map['street'] ?? '',
      landmark: map['landmark'] ?? '',
      city: map['city'] ?? '',
      district: map['district'] ?? '',
      state: map['state'] ?? '',
      nativeCity: map['nativeCity'] ?? '',
      nativeState: map['nativeState'] ?? '',
      country: map['country'] ?? '',
      pincode: map['pincode'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
    name,
    age,
    gender,
    maritalStatus,
    occupation,
    samajName,
    qualification,
    dob,
    bloodGroup,
    duties,
    phone,
    altPhone,
    landline,
    email,
    social,
    flat,
    building,
    street,
    landmark,
    city,
    district,
    state,
    nativeCity,
    nativeState,
    country,
    pincode,
  ];
}
