import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tam_kin_aeng_mobile_app/models/RecipeBundle.dart';

import '../../../size_config.dart';

class RecipeBundleCard extends StatelessWidget {
  final RecipeBundle recipeBundle;
  final Function press;

  const RecipeBundleCard({Key key, this.recipeBundle, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      // Bundle Box or you could say it a bundle frame
      decoration: BoxDecoration(
        color: recipeBundle.color,
        borderRadius: BorderRadius.circular(defaultSize * 1.8), //18
      ),
      child: Row(
        children: <Widget>[
          // Text or some detail about our bundle
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(defaultSize * 2), //20
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(),
                // Bundle Name
                Text(
                  recipeBundle.title,
                  style: TextStyle(
                    fontSize: defaultSize * 2.2, //22
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: defaultSize * 0.5), //5
                // Bundle details
                Text(
                  recipeBundle.description,
                  style: TextStyle(
                      color: Colors.white54, fontSize: defaultSize * 1.5),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                // Amount of recipes and chefs who we use his/her recipes in this bundle
                buildInfoRow(defaultSize,
                    iconSrc: "assets/icons/pot.svg",
                    text: "${recipeBundle.recipes} Recipes"),
                SizedBox(
                  height: defaultSize,
                ), //10
                buildInfoRow(defaultSize,
                    iconSrc: "assets/icons/chef.svg",
                    text: "${recipeBundle.chefs} Chefs"),
                Spacer(),
              ],
            ),
          )),
          SizedBox(width: defaultSize * 0.5), //5
          // Picture in our bundle frame
          AspectRatio(
            aspectRatio: 0.71,
            child: Image.asset(
              recipeBundle.imageSrcs,
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
            ),
          )
        ],
      ),
    );
  }

  // Make it into method or in Java we called function: for repetition
  Row buildInfoRow(double defaultSize, {String iconSrc, text}) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(
          iconSrc,
          width: defaultSize * 2, //20
        ),
        SizedBox(
          width: defaultSize, //10
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, defaultSize * 0.5, 0, 0),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: defaultSize * 1.5), //15
          ),
        ),
      ],
    );
  }
}
