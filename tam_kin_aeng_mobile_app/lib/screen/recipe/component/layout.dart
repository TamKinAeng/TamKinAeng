import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class RecipeBody extends StatefulWidget {
  @override
  _RecipeBodyState createState() => _RecipeBodyState();
}

class _RecipeBodyState extends State<RecipeBody> {
  @override
  Widget build(BuildContext context) {
    final recipes = Provider.of<QuerySnapshot>(context);
    SizeConfig().init(context);
    return SafeArea(
      // child: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Food name
            Container(
                margin: EdgeInsets.all(10),
                child: Text(recipes.docs.first['name'],
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      fontSize: 32,
                    )))),
            // Chef
            Container(
                margin: EdgeInsets.all(10),
                child: Text(recipes.docs.first['chef'],
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      fontSize: 16,
                    )))),
            Container(
                margin: EdgeInsets.all(5),
                child: Image.asset('assets/images/Food1.png')),
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
                          child: Text(recipes.docs.first['description'],
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
                

            
          ],
        ),
      ),
      // )
    );
  }
}