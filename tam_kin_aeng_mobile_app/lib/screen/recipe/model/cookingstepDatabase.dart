import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/home_screen.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/CookingPage.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/FinishPage.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/RecipePage.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/ingredientCheckbox.dart';

class ListCooking extends StatefulWidget {
  final int Index;
  final DocumentSnapshot StepDB;
  final CustomTimerController _controller = new CustomTimerController();

  ListCooking({Key key, @required this.Index, this.StepDB}) : super(key: key);
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
            .doc(widget.StepDB.id)
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
            child: Column(
              children: <Widget>[
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
                            'Step: ' + (widget.Index + 1).toString(),
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
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: Text(
                    lists[widget.Index]["value"],
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      letterSpacing: -1.0,
                      wordSpacing: 2.0,
                      fontSize: 20,
                    )),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (lists[widget.Index]["time"] > 0)
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 10,
                        child: CustomTimer(
                          controller: widget._controller,
                          from: Duration(seconds: lists[widget.Index]["time"]),
                          to: Duration(seconds: 0),
                          builder: (CustomTimerRemainingTime remaining) {
                            return Text(
                              "${remaining.hours}:${remaining.minutes}:${remaining.seconds}",
                              style: TextStyle(fontSize: 30.0),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                            child: Text(
                              "Start",
                              style: GoogleFonts.roboto(color: Colors.white),
                            ),
                            onPressed: () => widget._controller.start(),
                            color: Colors.green,
                          ),
                          FlatButton(
                            child: Text(
                              "Reset",
                              style: GoogleFonts.roboto(color: Colors.white),
                            ),
                            onPressed: () => widget._controller.reset(),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton.extended(
                            backgroundColor: Color.fromRGBO(60, 9, 108, 1),
                            label: Text("Next"),
                            onPressed: () {
                              if (widget.Index < lists.length - 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CookingScreen(
                                        index: widget.Index + 1,
                                        RecipeDB: widget.StepDB,
                                      ),
                                    ));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FinishScreen(
                                        finishDB: widget.StepDB,
                                      ),
                                    ));
                              }
                            }),
                      ],
                    ),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          );
        },
      ),
    );
  }
}
