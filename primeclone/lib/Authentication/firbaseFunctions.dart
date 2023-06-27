import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices{
  static saveUser(String fullname, String email, uid)async{
    await FirebaseFirestore.instance
    .collection('users')
    .doc(uid)
    .collection('personal details')
    .doc(uid)
    .set({'email':email,'name':fullname});
  }

}