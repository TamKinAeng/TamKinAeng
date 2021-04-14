import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/model/ingredient.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientTile extends StatelessWidget {

  final Ingredient ingredient;
  IngredientTile({ this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.all(5),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(ingredient.value,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 14,
                        )))
                  ]),
                ]));
  }
}