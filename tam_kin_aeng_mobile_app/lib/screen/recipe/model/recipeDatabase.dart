import 'package:cloud_firestore/cloud_firestore.dart';

class recipeDatabase {
  final DocumentReference recipeCollection =
      FirebaseFirestore.instance.collection('Recipe').doc('food1');

  //get recipe data
  Stream<DocumentSnapshot> get recipe {
    return recipeCollection.snapshots();
  }
}
