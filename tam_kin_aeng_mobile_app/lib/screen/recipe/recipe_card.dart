import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/models/TestRecipeCard.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';

class RecipeCard extends StatelessWidget {
  final RecipeDetail recipeDetail;

  const RecipeCard({Key key, this.recipeDetail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      width: MediaQuery.of(context).size.width *
          (defaultSize * 0.05), //ความกว้างของsection 50% ของจอ
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(defaultSize * 1.5),
            child: Container(
              height: defaultSize * 23,
              width: defaultSize * 20,
              child: Card(
                color: recipeDetail.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultSize * 1.5), // 15
                ),
                elevation: 8,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(defaultSize * 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Recipe Difficulty
                              Text(
                                recipeDetail.dificulty,
                                style: TextStyle(
                                  fontSize: defaultSize * 1.8, //20
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              // Recipe Time
                              Text(
                                recipeDetail.time.toString(),
                                style: TextStyle(
                                  fontSize: defaultSize * 1.8, //20
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              //Recipe Name
                              Text(
                                recipeDetail.name,
                                style: TextStyle(
                                  fontSize: defaultSize * 1.8,
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: defaultSize * 0.5),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: 60,
            height: defaultSize * 18,
            child: Image.asset(
              recipeDetail.imageSrcs,
            ),
          ),
        ],
      ),
    );
  }
}
