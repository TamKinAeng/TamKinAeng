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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 6,
            child: Row(
              children: [
                Card(
                  color: Color.fromRGBO(255, 109, 0, 1),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 200),
                    child: Text(
                      'Ingredient',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        height: 1.15,
                        fontSize: 38.0,
                        color: Colors.white,
                      )),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          Container(
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
                  }

                  return Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 1.4,
                        child: ListView(
                          children: <Widget>[
                            for (var i = 0; i < lists.length; i++)
                              Exercise(
                                title: lists[i].title,
                              )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
           
          ])
        ],
      ),
    );
  }
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
          activeColor: Color.fromRGBO(60, 9, 108, 1),
          value: selected,
          onChanged: (bool val) {
            setState(() {
              selected = val;
            });
          }),
    );
  }
}
