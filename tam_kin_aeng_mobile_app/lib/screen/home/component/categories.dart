import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

// Our Category List need StatefullWidget because
//it need to change regularly as the users are selected different category each time

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["All", "indain", "Italian", "Maxican", "Chinese"];
  // By default usually first one is selected which is "All"
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 2),
      child: SizedBox(
        height: SizeConfig.defaultSize * 3.5, //35
        child: ListView.builder(
            // Direction which user can scroll and box to show categories
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => buildCategoryItem(index)),
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    return GestureDetector(
      // Tap to change index which is changing our categories
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize * 2),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 2, //20
          vertical: SizeConfig.defaultSize * 0.5, //5
        ),
        decoration: BoxDecoration(
            // Selected box: Highlighted
            // Unselected box: Transparent
            color:
                selectedIndex == index ? Color(0xFFEFF3EE) : Colors.transparent,
            borderRadius: BorderRadius.circular(
              SizeConfig.defaultSize * 1.6, //16
            )),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            // Selected box: Colored
            // Unselected box: Grey color
            color: selectedIndex == index ? kPrimaryColor : Color(0xFFC2C2B5),
          ),
        ),
      ),
    );
  }
}
