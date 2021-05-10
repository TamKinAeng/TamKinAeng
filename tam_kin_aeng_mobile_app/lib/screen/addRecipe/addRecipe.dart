import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/screen/addRecipe/component/AddPage.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/component/body.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import 'component/body.dart';
import 'component/AddPage.dart';

class AddRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      //body for the add recipe landing page

      // We are not able to use BottomNavigationBar because the icon parameter dont accept SVG
      // We also use Provided to manage the state of our Nav
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => addpageScreen())); },
        child: const Icon(Icons.edit),
        backgroundColor: Color(0xFF3C096C),
      ),
      body: AddRecipeBody(),
      //button for add the recipe page
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  // Refactor -> Extract method from AppBar
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // This is icons and logo on our app bar
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {},
        ),
        // On Android by default its false
        centerTitle: true,
        title: Image.asset("assets/images/logoRevised.png",
        height: 37,),
        actions: <Widget>[
          SizedBox(
            // It means 5 because by out defaultSize = 10
            width: SizeConfig.defaultSize * 0.5,
          )
        ]);
  }
}
