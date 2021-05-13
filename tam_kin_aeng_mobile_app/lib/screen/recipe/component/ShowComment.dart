import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';


class CommentList extends StatefulWidget {
  final DocumentSnapshot CommentDB;

  const CommentList({Key key, this.CommentDB}) : super(key: key);
  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {

  double defaultSize = SizeConfig.defaultSize;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
            //get data
            stream: FirebaseFirestore.instance
                .collection('Recipe')
                .doc(widget.CommentDB.id)
                .collection('RecipeReview')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                // map the data in to document
                children: snapshot.data.docs.map((document) {
                  return Container(
                      margin: EdgeInsets.all(5),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(document["name"],
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    fontSize: 16,
                                  )),
                                  textAlign: TextAlign.start),
                              Container(
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/icons/star.svg", height: defaultSize*2,),
                                    Text(document["rating"],
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                          fontSize: 16,
                                        ))),
                                  ],
                                ),
                              ),
                              Text(""),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(document["comment"],
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 20,
                                ))),
                          ],
                        ),
                        Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: defaultSize * 1,
                              ),
                              child: Container(
                                color: Colors.black,
                                height: defaultSize * 0.1,
                                width: defaultSize * 50,
                              ),
                            )
                      ]));
                }).toList(),
              );
            }));
  }
}
