import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/component/search.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/component/layout.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/model/cookingstepDatabase.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/CookingPage.dart';

class RecipeScreen extends StatelessWidget {
  final DocumentSnapshot recipeIndex;

  const RecipeScreen({Key key, this.recipeIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // return StreamProvider<QuerySnapshot>.value(
    //       value: recipeDatabase().recipe,
    //       child:
    return Scaffold(
        appBar: buildAppBar(context),
        body: RecipeBody(
          recipeRecieve: recipeIndex,
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text("Start Cooking!!"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CookingScreen(index: 0),
                ));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: MyBottomNavBar()
        // ),
        );
  }

  AppBar buildAppBar(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return AppBar(
        // This is icons and logo on our app bar
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // On Android by default its false
        centerTitle: true,
        title: Image.asset(
          "assets/images/logoRevised.png",
          height: defaultSize * 4,
        ),
        actions: <Widget>[
          // Search Button
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
          SizedBox(
            // It means 5 because by out defaultSize = 10
            width: SizeConfig.defaultSize * 0.5,
          )
        ]);
  }
}
