import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';

import 'RecipePage.dart';

class FavRecipeCard extends StatelessWidget {
  final QueryDocumentSnapshot recipeDetail;
  final Color color;

  const FavRecipeCard({Key key, this.recipeDetail, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    var repCard = recipeDetail;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RecipeScreen(
                      recipeIndex: repCard,
                    )));
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              height: defaultSize * 17,
              width: defaultSize * 100,
              child: Card(
                color: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultSize * 1.5), // 15
                ),
                elevation: 8,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(defaultSize),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Recipe Name
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 10, 0, 3),
                                child: Text(
                                  repCard['name'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Spacer(),
                              //Recipe Chef
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 0, 3),
                                child: Text(
                                  repCard['chef'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Spacer(),
                              // Recipe Difficulty
                              Padding(
                                padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                                child: Stack(
                                  children: [
                                    Container(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, bottom: 10),
                                        child: SvgPicture.asset(
                                          repCard['dificulty'] == 'low'
                                              ? "assets/icons/low_level.svg"
                                              : repCard['dificulty'] == 'mid'
                                                  ? "assets/icons/med_level.svg"
                                                  : "assets/icons/high_level.svg",
                                          height: defaultSize * 2,
                                          width: defaultSize * 2,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 35, top: 3),
                                      child: Container(
                                        child: Text(
                                          repCard['dificulty'],
                                          style: TextStyle(
                                            fontSize: 13, //20
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              // Recipe Time
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 0, 3),
                                child: Stack(
                                  children: [
                                    Container(
                                      child: SvgPicture.asset(
                                        "assets/icons/clock.svg",
                                        height: defaultSize * 1.8,
                                        width: defaultSize * 1.8,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 20, top: 1, bottom: 10),
                                        child: Text(
                                          "${repCard['time'].toString()} M",
                                          style: TextStyle(
                                            fontSize: 13, //20
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
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
            right: 40,
            top: 17,
            child: Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(repCard['imgUrl']),
                backgroundColor: Colors.transparent,
                radius: 58.0,
              ),
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(
                    color: Color(0xFFFFFFFF),
                    width: 5.0,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
