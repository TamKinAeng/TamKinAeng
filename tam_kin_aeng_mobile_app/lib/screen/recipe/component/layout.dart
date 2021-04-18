import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/model/recipeDatabase.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/model/ingredientDatabase.dart';

class RecipeBody extends StatefulWidget {
  @override
  _RecipeBodyState createState() => _RecipeBodyState();
}

class _RecipeBodyState extends State<RecipeBody> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder<DocumentSnapshot>(
      stream: recipeDatabase().recipe,
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
        if(snapshot.hasData){
          var recipes = snapshot.data.data();
          return Scaffold(
        // child: Center(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Food name
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text(recipes['name'],
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontSize: 32,
                      )))),
              // Chef
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Chef: " + recipes['chef'],
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontSize: 16,
                      )))),
              Container(
                  margin: EdgeInsets.all(5),
                  child: Image.network(recipes['imgUrl'])),
              Container(
                  margin: EdgeInsets.all(10),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text('Description',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 18,
                        )))
                  ])),
              // Description content
              Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                            child: Text(recipes['description'],
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey,
                                ))))
                      ])),
              Container(
                  margin: EdgeInsets.all(10),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text('Ingredient',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 18,
                        )))
                  ])),
                   Container(
                     width: MediaQuery.of(context).size.width / 1.2,
                     height: MediaQuery.of(context).size.height / 3,
                     child: ListIngredient()),
            ],
          ),
        ),
        // )
      );
        }
      }
    );
  }
}
