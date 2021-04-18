import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/model/ingredient.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class ingredientDatabase {

//   final CollectionReference ingredientCollection = FirebaseFirestore.instance.collection('Recipe').doc('food1').collection('ingredient');

//   //ingredient list from snapshot
//   List<Ingredient> _ingredientListFromSnapshot(QuerySnapshot snapshot){
//     return snapshot.docs.map((doc){
//       return Ingredient(
//         value: doc.data()['value'] ?? ''
//       );
//     }).toList();
//   }

//   //get ingredient data
//   Stream<List<Ingredient>> get ingredient {
//     return ingredientCollection.snapshots().map(_ingredientListFromSnapshot);
//   }
// }

class ListIngredient extends StatefulWidget {
  @override
  _ListIngredientState createState() => _ListIngredientState();
}

class _ListIngredientState extends State<ListIngredient> {
  // Future getIngredient() async {
  //   var firestore = FirebaseFirestore.instance;

  //   QuerySnapshot ingredient = await firestore
  //       .collection('Recipe')
  //       .doc('food1')
  //       .collection('ingredient')
  //       .get();

  //   return ingredient.docs;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Recipe').doc('food1').collection('ingredient').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
                }

                return ListView(
                children: snapshot.data.docs.map((document) {
                  return Container(
                      margin: EdgeInsets.all(5),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(document["value"],
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    fontSize: 14,
                                  )))
                            ]),
                      ]));
                }).toList(),
              );
              }
              
            )
        );
  }
}
