import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/material/checkbox_list_tile.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/component/search.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/model/checkBox.dart';

import '../../size_config.dart';
import 'CookingPage.dart';
import 'FinishPage.dart';
import 'RecipePage.dart';

class CheckboxList extends StatefulWidget {
  final DocumentSnapshot IngredientDB;

  CheckboxList({Key key, this.IngredientDB}) : super(key: key);

  @override
  _CheckboxListState createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Recipe')
              .doc(widget.IngredientDB.id)
              .collection('ingredient')
              .snapshots(),
          builder: (BuildContext context, snapshot) {
            var lists = [];
            if (snapshot.hasData) {
              lists.clear();
              Map<dynamic, dynamic> values = snapshot.data.docs.asMap();
              // print(values[0]['value']);
              // print(IngredientCheck(title: values[0]['value']));
              for (var i = 0; i < values.length; i++) {
                lists.add(IngredientCheck(title: values[i]['value']));
              }

              // values.forEach((key, value) {
              //   lists.add(IngredientCheck(title: values['value']));
              // });
              // print(lists[0]);

            }

            // return Scaffold(
            //   body: Column(
            //     children: [
            //       SizedBox(
            //         height: 200.0,
            //         child: ListView(
            //           children: [
            //             ...lists.map(buildSingleCheckbox).toList(),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // );

            return Scaffold(
                appBar: buildAppBar(context),
                body: ListView(
                  children: <Widget>[
                    for (var i = 0; i < lists.length; i++)
                      Exercise(
                        title: lists[i].title,
                      )
                  ],
                ),
                floatingActionButton: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  FloatingActionButton.extended(
                            label: Text("Back"),
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeScreen(
                                        recipeIndex: widget.IngredientDB,
                                      ),
                                    ));
                            }),
                        FloatingActionButton.extended(
                            label: Text("Next"),
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CookingScreen(
                                        index: 0,
                                        RecipeDB: widget.IngredientDB,
                                      ),
                                    ));
                            }),
                ],),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                bottomNavigationBar: MyBottomNavBar());
          }),
    );
    //         }),
    //   );
    // }

    // dynamic buildSingleCheckbox(IngredientCheck notification) => buildCheckbox(
    //       notification: notification,
    //       onClicked: () {
    //         setState(() {
    //           final newValue = !notification.value;
    //           notification.value = newValue;
    //         });
    //       },
    //     );

    // dynamic buildCheckbox({
    //   @required IngredientCheck notification,
    //   @required VoidCallback onClicked,
    // }) =>
    //     ListTile(
    //       onTap: onClicked,
    //       leading: Checkbox(
    //         value: notification.value,
    //         onChanged: (value) => onClicked(),
    //       ),
    //       title: Text(
    //         notification.title,
    //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //       ),
    //     );
  }
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

class Exercise extends StatefulWidget {
  final String title;

  Exercise({this.title});

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      trailing: Checkbox(
          value: selected,
          onChanged: (bool val) {
            setState(() {
              selected = val;
            });
          }),
    );
  }
}
