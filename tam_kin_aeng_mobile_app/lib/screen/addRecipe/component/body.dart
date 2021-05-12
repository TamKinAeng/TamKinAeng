

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
  Widget build(BuildContext context)  {
    final ref = FirebaseFirestore.instance.collection('Users').doc(uid).collection('AddRecipe');
    return Scaffold(
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
            return Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  EditPage(
                                    docToEdit: snapshot.data.docs[index],)));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.orange[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(snapshot.data.docs[index].data()['name'],
                                    style: TextStyle(fontSize: 25)),
                                Text(snapshot.data.docs[index]
                                    .data()['description'],
                                  style: TextStyle(fontSize: 15),
                                  overflow: TextOverflow.ellipsis, maxLines: 5,),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );

        },
      ),
    );
  }
}
