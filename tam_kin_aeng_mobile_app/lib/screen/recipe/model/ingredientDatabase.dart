import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListIngredient extends StatefulWidget {
  final DocumentSnapshot RecipeDB;

  const ListIngredient({Key key, this.RecipeDB}) : super(key: key);
  @override
  _ListIngredientState createState() => _ListIngredientState();
}

class _ListIngredientState extends State<ListIngredient> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
          //get data
            stream: FirebaseFirestore.instance.collection('Recipe').doc(widget.RecipeDB.id).collection('ingredient').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
                }

                return ListView(
                  // map the data in to document
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
