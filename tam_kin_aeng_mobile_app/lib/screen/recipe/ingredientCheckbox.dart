import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckboxList extends StatefulWidget {
  @override
  _CheckboxListState createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
        child: StreamBuilder(
            //get data
            stream: FirebaseFirestore.instance
                .collection('Recipe')
                .doc('food1')
                .collection('ingredient')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return SingleChildScrollView(
                child: ListView(
                  shrinkWrap: true,
                  // map the data in to document
                  children: []
                ),
              );
            })),
  );
  }

