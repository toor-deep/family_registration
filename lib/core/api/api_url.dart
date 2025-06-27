import 'package:cloud_firestore/cloud_firestore.dart';

class ApiUrl {
  const ApiUrl._();

  static final headUsers = FirebaseFirestore.instance.collection("head");

  static CollectionReference members(String headId) =>
      headUsers.doc(headId).collection('members');
}
