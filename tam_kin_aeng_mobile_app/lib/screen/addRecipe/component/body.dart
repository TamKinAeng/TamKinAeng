import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import 'EditPage.dart';

class AddRecipeBody extends StatelessWidget {
  
  final ref = FirebaseFirestore.instance.collection('AddRecipe');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
          return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.hasData?snapshot.data.docs.length:0,
              itemBuilder: (_,index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(docToEdit: snapshot.data.docs[index],)));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 150,
                  color: Colors.orange[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(snapshot.data.docs[index].data()['foodname'],
                            style: TextStyle(fontSize: 25)),
                        Text(snapshot.data.docs[index].data()['description'],
                            style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,maxLines: 4,),
                      ],
                    ),
                  ),
                ),
              );
              });
        }
      ),
    );
  }
}
