import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/constants.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/component/body.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/component/categories.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'component/search.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(
          children: [
            Body(),
            Categories(
              category: "Indian",
            ),
            Categories(
              category: "Italian",
            ),
            Categories(
              category: "American",
            ),
            Categories(
              category: "Global",
            ),
          ],
        ),
        // We are not able to use BottomNavigationBar because the icon parameter dont accept SVG
        // We also use Provided to manage the state of our Nav
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }

  // Refactor -> Extract method from AppBar
  AppBar buildAppBar(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return AppBar(
      // This is icons and logo on our app bar
      // leading: IconButton(
      //   icon: SvgPicture.asset("assets/icons/menu.svg"),
      //   onPressed: () {},
      // ),

      // On Android by default its false
      centerTitle: true,
      title: Image.asset("assets/images/logo.png"),
      actions: <Widget>[
        // Search Button
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
        ),
        SizedBox(
          // It means 5 because by out defaultSize = 10
          width: SizeConfig.defaultSize * 0.5,
        )
      ],
      bottom: TabBar(
        // indicatorPadding: EdgeInsets.all(defaultSize * 5),
        // indicatorSize: TabBarIndicatorSize.label,

        indicator: BubbleTabIndicator(
            indicatorHeight: defaultSize * 3,
            indicatorColor: kPrimaryColor,
            tabBarIndicatorSize: TabBarIndicatorSize.tab),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        // labelPadding: EdgeInsets.symmetric(horizontal: defaultSize * 1.5),
        isScrollable: true,
        tabs: [
          Tab(
            child: Text(
              "All",
              style: TextStyle(
                fontSize: defaultSize * 1.5,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Indian",
              style: TextStyle(
                fontSize: defaultSize * 1.5,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Italian",
              style: TextStyle(
                fontSize: defaultSize * 1.5,
              ),
            ),
          ),
          Tab(
            child: Text(
              "American",
              style: TextStyle(
                fontSize: defaultSize * 1.5,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Global",
              style: TextStyle(
                fontSize: defaultSize * 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
