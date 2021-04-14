import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/model/ingredient.dart';

class ingredientDatabase {

  final CollectionReference ingredientCollection = FirebaseFirestore.instance.collection('Recipe').doc('food1').collection('ingredient');

  //ingredient list from snapshot
  List<Ingredient> _ingredientListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Ingredient(
        value: doc.data()['value'] ?? ''
      );
    }).toList();
  }

  //get ingredient data
  Stream<List<Ingredient>> get ingredient {
    return ingredientCollection.snapshots().map(_ingredientListFromSnapshot);
  }
}
