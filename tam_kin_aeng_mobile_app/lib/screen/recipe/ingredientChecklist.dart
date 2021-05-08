import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/CookingPage.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/RecipePage.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/ingredientCheckbox.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/model/cookingstepDatabase.dart';

import '../../size_config.dart';

class IngredientChecklist extends StatelessWidget {
  //
  final DocumentSnapshot RecipeDB;

  const IngredientChecklist({Key key, this.RecipeDB}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: buildAppBar(context),
        body: CheckboxList(
          IngredientDB: RecipeDB,
        ),
        floatingActionButton: FloatingActionButton.extended(
                backgroundColor: Color.fromRGBO(60, 9, 108, 1),
                label: Text("Next"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CookingScreen(
                          index: 0,
                          RecipeDB: RecipeDB,
                        ),
                      ));
                }),
        bottomNavigationBar: MyBottomNavBar());
  }

  AppBar buildAppBar(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return AppBar(
        // This is icons and logo on our app bar
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeScreen(
                      recipeIndex: RecipeDB,
                    ),
                  ));
          },
        ),
        // On Android by default its false
        centerTitle: true,
        title: Image.asset(
          "assets/images/logoRevised.png",
          height: defaultSize * 4,
        ),
        );
  }
}