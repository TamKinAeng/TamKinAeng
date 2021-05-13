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

Future<Map<String, String>> getUserInfo() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String _email = auth.currentUser.email.toString();
  String _uid = auth.currentUser.uid.toString();
  final users = await FirebaseFirestore.instance.collection('Users').doc(_uid).get();

  /* FirebaseFirestore.instance.collection('Users').get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            users.doc(_email).get();
        });
    }); */
    print(users);
    print(users["Firstname"]);
    print(users["Email"]);
    return {"firstname":users["Firstname"],"lastname": users["Lastname"],"email":users["Email"]};
}
Future<String> getName() async {
  String _name;
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    users.doc(uid).get().then((querySnapshot){
      _name = querySnapshot.data()["Firstname"]; 
      return _name;
  });
  
}