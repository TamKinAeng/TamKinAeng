import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/models/TestRecipeCategories.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';

class Categories extends StatelessWidget {
  final String category; // pass from home screen

  const Categories({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: Container(
                child: ListView.builder(
                  itemCount: recipeCateDetails.length,
                  itemBuilder: (context, index) => CategoriesData(
                    recipeCateDetail: recipeCateDetails[index],
                    cuisine: category,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoriesData extends StatelessWidget {
  final RecipeCateDetail recipeCateDetail;
  final String cuisine;

  const CategoriesData({Key key, this.recipeCateDetail, this.cuisine})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    if (recipeCateDetail.cuisine.toLowerCase() == cuisine.toLowerCase()) {
      // Check whether the cuisine are matching with category or not
      return Container(
        height: MediaQuery.of(context).size.height * 0.13,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: defaultSize * 0.5),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, defaultSize * 3, 0),
                    child: Image.asset(
                      recipeCateDetail.imageSrcs,
                      height: defaultSize * 7.5, //75
                      width: defaultSize * 10, //100
                      fit: BoxFit.fill,
                      // scale: 0.8,
                    ),
                  ),
                  Container(
                    height: defaultSize * 7.5,
                    width: defaultSize * 23,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipeCateDetail.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          recipeCateDetail.description,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: defaultSize * 1,
              ),
              child: Container(
                color: Colors.black,
                height: defaultSize * 0.1,
                width: defaultSize * 50,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
