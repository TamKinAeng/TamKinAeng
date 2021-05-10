import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userInfo(String _email, String _firstname, String _lastname, String _gender, String _birthdate) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.doc(uid).set({
    'Email': _email,
    'Uid': uid,
    'Firstname': _firstname,
    'Lastname': _lastname,
    'Gender': _gender,
    'Birthdate': _birthdate
  });
  return;
}

Future<String> getUID() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  String uid = auth.currentUser.uid.toString();
  users.doc(uid).get();

  return uid;
}
