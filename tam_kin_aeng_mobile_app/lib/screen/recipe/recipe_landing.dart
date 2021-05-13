import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/constants.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/component/search.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/recipe_card.dart';

import '../../size_config.dart';

class RecipeLanding extends StatelessWidget {
  final DocumentSnapshot recipeDetail;

  const RecipeLanding({Key key, this.recipeDetail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('RecipeBundle')
          .doc(recipeDetail.id)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        }
        var repList = snapshot.data.data();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: buildAppBar(context),
          body:
              // Recipe Card
              Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding:
                          EdgeInsets.fromLTRB(5, 0, 2, 0), // นอน 16 ตั้ง 20
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // mainAxisSpacing: 5,
                          // crossAxisSpacing: 5,
                        ),
                        itemCount: repList['recipeList'].length,
                        itemBuilder: (context, index) => RecipeCard(
                          recipeDetail: repList['recipeList'][index],
                          color: Color(index % 2 == 0
                              ? repList['subColor1']
                              : repList['subColor2']),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: MyBottomNavBar(),
        );
      },
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DataSearch()));
            },
          ),
          SizedBox(
            // It means 5 because by out defaultSize = 10
            width: SizeConfig.defaultSize * 0.5,
          )
        ]);
  }
}
