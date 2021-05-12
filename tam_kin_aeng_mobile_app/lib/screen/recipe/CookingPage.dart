import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/ingredientChecklist.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/model/cookingstepDatabase.dart';

class CookingScreen extends StatelessWidget {
  //
  final int index;
  final DocumentSnapshot RecipeDB;

  const CookingScreen({Key key, this.index, this.RecipeDB}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top:10),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/test.jpg"),
              fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(context),
          body: ListCooking(
            Index: index,
            StepDB: RecipeDB,
          ),
          bottomNavigationBar: MyBottomNavBar()),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return AppBar(
      backgroundColor: Colors.transparent,
      // This is icons and logo on our app bar
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg",color: Colors.white,),
        onPressed: () {
          if (index > 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CookingScreen(
                    index: index - 1,
                    RecipeDB: RecipeDB,
                  ),
                ));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IngredientChecklist(
                    RecipeDB: RecipeDB,
                  ),
                ));
          }
        },
      ),
    );
  }
}
