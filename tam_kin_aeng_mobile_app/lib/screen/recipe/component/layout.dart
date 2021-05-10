import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/model/ingredientDatabase.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/component/ShowComment.dart';

class RecipeBody extends StatefulWidget {
  final DocumentSnapshot recipeRecieve;

  const RecipeBody({Key key, this.recipeRecieve}) : super(key: key);

  @override
  _RecipeBodyState createState() => _RecipeBodyState(recipeRecieve);
}

class _RecipeBodyState extends State<RecipeBody> {
  final DocumentSnapshot recipeDatababe;

  _RecipeBodyState(this.recipeDatababe);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Recipe')
            .doc(recipeDatababe.id)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              child: Row(
                            children: [
                              if (recipes['dificulty'] == "low")
                                SvgPicture.asset(
                                  "assets/icons/low_grey.svg",
                                  height: defaultSize * 2,
                                ),
                              if (recipes['dificulty'] == "medium")
                                SvgPicture.asset(
                                  "assets/icons/med_grey.svg",
                                  height: defaultSize * 2,
                                ),
                              Text(" "+recipes['dificulty']+" level",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    fontSize: 16,
                                  ))),
                            ],
                          )),
                          Container(
                              child: Row(
                            children: [
                              Image.asset(
                                "assets/images/timer.png",
                                height: defaultSize * 2,
                              ),
                              Text(" "+recipes['time'] + " Minutes",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    fontSize: 16,
                                  ))),
                            ],
                          )),
                          Container(child: Text(""),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Description',
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                      fontSize: 18,
                                    )))
                              ])),
                    ),
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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Ingredient',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    fontSize: 18,
                                  )))
                            ])),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 4,
                        child: ListIngredient(RecipeDB: recipeDatababe)),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Review & Comment',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    fontSize: 18,
                                  )))
                            ])),
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: CommentList(
                        CommentDB: recipeDatababe,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                  ],
                ),
              ),
              // )
            );
          }
        });
  }
}
