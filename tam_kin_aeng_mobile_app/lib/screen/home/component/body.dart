import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/models/RecipeBundle.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';

import 'recipe_bundle_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.defaultSize * 2), //20
              child: GridView.builder(
                itemCount: recipeBundles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // For both vertical and horizontal view
                  crossAxisCount:
                      SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing:
                      SizeConfig.orientation == Orientation.landscape
                          ? SizeConfig.defaultSize * 2
                          : 0,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => RecipeBundleCard(
                  recipeBundle: recipeBundles[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
