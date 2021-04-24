import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/models/TestRecipeCard.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/component/search.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/recipe_card.dart';

import '../../size_config.dart';

class RecipeLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // Recipe Card
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Container(
                          color: Color(0xFFEEEEEE),
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultSize * 1.6,
                            vertical: defaultSize * 1.2,
                          ), // นอน 16 ตั้ง 20
                          height: MediaQuery.of(context).size.height *
                              (defaultSize *
                                  0.03), // ความสูงของsection 30% ของจอ
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: recipeDetails.length,
                            itemBuilder: (context, index) => RecipeCard(
                              recipeDetail: recipeDetails[index],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
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
