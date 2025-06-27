
import 'package:equatable/equatable.dart';

class FamilyMemberModel extends Equatable {
  // Personal Info
  final String id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String relation;
  final String dob;
  final String gender;
  final String maritalStatus;
  final String occupation;
  final String qualification;
  final String bloodGroup;
  final String age;
  final String? photoUrl;

  // Contact Info
  final String phone;
  final String altPhone;
  final String landline;
  final String email;
  final String social;

  // Address Info
  final String flat;
  final String building;
  final String doorNumber;
  final String street;
  final String landmark;
  final String city;
  final String district;
  final String state;
  final String nativeCity;
  final String nativeState;
  final String country;
  final String pincode;

  const FamilyMemberModel({
    required this.firstName,
    required this.id,
    required this.middleName,
    required this.lastName,
    required this.relation,
    required this.dob,
    required this.gender,
    required this.maritalStatus,
    required this.occupation,
    required this.qualification,
    required this.bloodGroup,
    required this.age,
    this.photoUrl,
    required this.phone,
    required this.altPhone,
    required this.landline,
    required this.email,
    required this.social,
    required this.flat,
    required this.building,
    required this.doorNumber,
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
      'firstName': firstName,
      'id':id,
      'middleName': middleName,
      'lastName': lastName,
      'relation': relation,
      'dob': dob,
      'gender': gender,
      'maritalStatus': maritalStatus,
      'occupation': occupation,
      'qualification': qualification,
      'bloodGroup': bloodGroup,
      'age': age,
      'photoUrl': photoUrl,
      'phone': phone,
      'altPhone': altPhone,
      'landline': landline,
      'email': email,
      'social': social,
      'flat': flat,
      'building': building,
      'doorNumber': doorNumber,
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

  factory FamilyMemberModel.fromMap(Map<String, dynamic> map,String id) {
    return FamilyMemberModel(
      firstName: map['firstName'] ?? '',
      id: id ?? '',
      middleName: map['middleName'] ?? '',
      lastName: map['lastName'] ?? '',
      relation: map['relation'] ?? '',
      dob: map['dob'] ?? '',
      gender: map['gender'] ?? '',
      maritalStatus: map['maritalStatus'] ?? '',
      occupation: map['occupation'] ?? '',
      qualification: map['qualification'] ?? '',
      bloodGroup: map['bloodGroup'] ?? '',
      age: map['age'] ?? '',
      photoUrl: map['photoUrl'],
      phone: map['phone'] ?? '',
      altPhone: map['altPhone'] ?? '',
      landline: map['landline'] ?? '',
      email: map['email'] ?? '',
      social: map['social'] ?? '',
      flat: map['flat'] ?? '',
      building: map['building'] ?? '',
      doorNumber: map['doorNumber'] ?? '',
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
  FamilyMemberModel copyWith({
    String? id,
    String? firstName,
    String? middleName,
    String? lastName,
    String? relation,
    String? dob,
    String? gender,
    String? maritalStatus,
    String? occupation,
    String? qualification,
    String? bloodGroup,
    String? age,
    String? photoUrl,
    String? phone,
    String? altPhone,
    String? landline,
    String? email,
    String? social,
    String? flat,
    String? building,
    String? doorNumber,
    String? street,
    String? landmark,
    String? city,
    String? district,
    String? state,
    String? nativeCity,
    String? nativeState,
    String? country,
    String? pincode,
  }) {
    return FamilyMemberModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      relation: relation ?? this.relation,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      occupation: occupation ?? this.occupation,
      qualification: qualification ?? this.qualification,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      age: age ?? this.age,
      photoUrl: photoUrl ?? this.photoUrl,
      phone: phone ?? this.phone,
      altPhone: altPhone ?? this.altPhone,
      landline: landline ?? this.landline,
      email: email ?? this.email,
      social: social ?? this.social,
      flat: flat ?? this.flat,
      building: building ?? this.building,
      doorNumber: doorNumber ?? this.doorNumber,
      street: street ?? this.street,
      landmark: landmark ?? this.landmark,
      city: city ?? this.city,
      district: district ?? this.district,
      state: state ?? this.state,
      nativeCity: nativeCity ?? this.nativeCity,
      nativeState: nativeState ?? this.nativeState,
      country: country ?? this.country,
      pincode: pincode ?? this.pincode,
    );
  }

  @override
  List<Object?> get props => [
    id,
    firstName,
    middleName,
    lastName,
    relation,
    dob,
    gender,
    maritalStatus,
    occupation,
    qualification,
    bloodGroup,
    age,
    photoUrl,
    phone,
    altPhone,
    landline,
    email,
    social,
    flat,
    building,
    doorNumber,
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
