import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/screen/profile/component/profile_menu_item.dart';
import '../../../size_config.dart';
import 'info.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "assets/images/ios_large_1531731534_image.jpg",
            name: "Platelet Approve Dis EHE",
            email: "PlateletIsHorny@242517.com",
          ),
          SizedBox(
            height: SizeConfig.defaultSize * 2, //20
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/bookmark_fill.svg",
            title: "Saved Recipes",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/chef_color.svg",
            title: "Super Plan",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/language.svg",
            title: "Change language",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/info.svg",
            title: "Help",
            press: () {},
          ),
        ],
      ),
    );
  }
}
