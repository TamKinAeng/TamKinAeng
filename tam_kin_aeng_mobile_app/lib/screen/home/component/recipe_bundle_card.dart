import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/recipe_landing.dart';

import '../../../size_config.dart';

class RecipeBundleCard extends StatelessWidget {
  final DocumentSnapshot index;

  const RecipeBundleCard({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('RecipeBundle')
          .doc(index.id)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text("Loading..."),
          );
        }
        var bundle = snapshot.data.data();
        return InkWell(
          // use InkWell to response to user click on the bundle
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeLanding(
                          recipeDetail: index,
                        )));
          },
          // Optional: can add some ripple effect to the InkWell to make our bundle card more beautiful
          child: Padding(
            padding: EdgeInsets.fromLTRB(SizeConfig.defaultSize * 1.8,
                defaultSize * 2, SizeConfig.defaultSize * 1.8, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * (defaultSize * 0.03),
              // Bundle Box or you could say it a bundle frame
              decoration: BoxDecoration(
                // color: snapshot.data.data()["color"],
                color: Color(bundle['color']),
                borderRadius: BorderRadius.circular(defaultSize * 1.8), //18
              ),
              child: Row(
                children: <Widget>[
                  // Text or some detail about our bundle
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        defaultSize * 2, 0, defaultSize, 0), //20
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Spacer(),
                        // Bundle Name
                        Text(
                          bundle['title'].toString(),
                          style: TextStyle(
                              fontSize: defaultSize * 2.3, //20
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: defaultSize * 1.5), //5
                        // Bundle details
                        Text(
                          bundle['description'].toString(),
                          style: TextStyle(
                              color: Colors.white54, fontSize: defaultSize * 2),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                      ],
                    ),
                  )),
                  // Picture in our bundle frame
                  AspectRatio(
                    aspectRatio: 0.71,
                    child: Image.network(
                      bundle['imgUrl'],
                      fit: BoxFit.cover,
                      alignment: Alignment.centerLeft,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
