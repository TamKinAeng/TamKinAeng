import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/home_screen.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/CookingPage.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/FinishPage.dart';

class ListCooking extends StatefulWidget {
  final int Index;

  ListCooking({Key key, @required this.Index}) : super(key: key);
  @override
  _ListCookingState createState() => _ListCookingState();
}

class _ListCookingState extends State<ListCooking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Recipe')
            .doc('food1')
            .collection('cookingStep')
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          var lists = [snapshot.data.docs.length];
          if (snapshot.hasData) {
            lists.clear();
            Map<dynamic, dynamic> values = snapshot.data.docs.asMap();
            values.forEach((key, values) {
              lists.add(values);
            });
          }
          return SingleChildScrollView(
            child: Center(
              child: Container(
                margin: EdgeInsets.all(5),
                child: Center(
                  child: Column(children: [
                    Text(lists[widget.Index]["value"],
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 48,
                        ))),
                    FloatingActionButton.extended(
                        label: Text("Next"),
                        onPressed: () {
                          if (widget.Index < lists.length-1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CookingScreen(index: widget.Index + 1),
                                ));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FinishScreen(),
                                ));
                          }
                        })
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
