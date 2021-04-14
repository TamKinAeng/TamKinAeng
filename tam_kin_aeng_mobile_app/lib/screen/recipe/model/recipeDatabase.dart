import 'package:cloud_firestore/cloud_firestore.dart';

class recipeDatabase {

  final CollectionReference recipeCollection = FirebaseFirestore.instance.collection('Recipe');


  //get recipe data
  Stream<QuerySnapshot> get recipe {
    return recipeCollection.snapshots();
  }
}

