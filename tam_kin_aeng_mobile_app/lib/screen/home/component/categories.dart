import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/RecipePage.dart';
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
                child: CategoriesData(
                  cuisine: category,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesData extends StatelessWidget {
  final String cuisine;

  const CategoriesData({Key key, this.cuisine}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Recipe').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        }
        return Container(
          height: MediaQuery.of(context).size.height * 0.3, //30
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              return snapshot.data.docs[index]['cuisine']
                          .toString()
                          .toLowerCase() ==
                      cuisine
                          .toLowerCase() // Check whether the cuisine are matching with category or not
                  ? InkWell(
                      // use inkWell to make our recipe on each categories clickable
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecipeScreen(
                                      recipeIndex: snapshot.data.docs[index],
                                    )));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: defaultSize * 0.5, //5
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0, 0, defaultSize * 3, 0),
                                  child: Image.network(
                                    snapshot.data.docs[index]['imgUrl'],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data.docs[index]['name'],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          snapshot.data.docs[index]
                                              ['description'],
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
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
                    )
                  : Container();
            },
          ),
        );
      },
    );
  }
}
