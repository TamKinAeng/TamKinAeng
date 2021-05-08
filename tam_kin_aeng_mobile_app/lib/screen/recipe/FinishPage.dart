import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/component/search.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/home_screen.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/component/FinishRecipe.dart';


class FinishScreen extends StatelessWidget {
  final DocumentSnapshot finishDB;

  const FinishScreen({Key key, this.finishDB}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: buildAppBar(context),
        body: Container(child: FinishContent(finishDB: finishDB,)),
        // Go back to HomeScreen button
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color.fromRGBO(60, 9, 108, 1),
          label: Text("Finish"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: MyBottomNavBar()
        // ),
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
