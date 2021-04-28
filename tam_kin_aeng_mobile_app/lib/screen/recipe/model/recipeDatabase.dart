// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class recipeDatabase {
//   final DocumentSnapshot Doc;
//   final DocumentReference recipeCollection =
//       FirebaseFirestore.instance.collection('Recipe').doc(Doc.toString());

//   recipeDatabase({Key key, @required this.Doc}) : super(key: key);

//   //get recipe data
//   Stream<DocumentSnapshot> get recipe {
//     return recipeCollection.snapshots();
//   }
// }
