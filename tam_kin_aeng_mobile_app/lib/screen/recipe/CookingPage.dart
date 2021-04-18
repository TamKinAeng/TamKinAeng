import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/component/layout.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/model/cookingstepDatabase.dart';

class CookingScreen extends StatelessWidget {
  final int index;

  const CookingScreen({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // return StreamProvider<QuerySnapshot>.value(
    //       value: recipeDatabase().recipe,
    //       child:
    return Scaffold(
        appBar: buildAppBar(),
        body: ListCooking(Index: index),
        bottomNavigationBar: MyBottomNavBar()
        // ),
        );
  }

  AppBar buildAppBar() {
    return AppBar(
        // This is icons and logo on our app bar
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {},
        ),
        // On Android by default its false
        centerTitle: true,
        title: Image.asset("assets/images/logo.png"),
        actions: <Widget>[
          // Search Button
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {},
          ),
          SizedBox(
            // It means 5 because by out defaultSize = 10
            width: SizeConfig.defaultSize * 0.5,
          )
        ]);
  }
}
