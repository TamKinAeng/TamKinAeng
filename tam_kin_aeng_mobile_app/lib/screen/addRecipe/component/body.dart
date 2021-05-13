import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import 'EditPage.dart';

class AddRecipeBody extends StatefulWidget {
  //static String uid;
  @override
  _AddRecipeBodyState createState() => _AddRecipeBodyState();
}

class _AddRecipeBodyState extends State<AddRecipeBody> {
  String uid;
  Future<String> getUID() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    setState(() {
      uid = auth.currentUser.uid.toString();
    });
    users.doc(uid).get();

    return uid;
  }

  @override
  void initState() {
    getUID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('AddRecipe');
    // final ref = FirebaseFirestore.instance
    //     .collection('AddRecipe');
    return Scaffold(
      body: Column(
        children: [Container( width: MediaQuery.of(context).size.width*0.9,
            child: Text('Add Recipe',style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF2B2B2B),
                    fontWeight: FontWeight.bold)),)),
          Expanded(
            child: StreamBuilder(
              stream: ref.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditPage(
                                        docToEdit: snapshot.data.docs[index],
                                      )));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF6D00),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(snapshot.data.docs[index].data()['name'],
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))),
                                Text(
                                  snapshot.data.docs[index].data()['description'],
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  )),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
