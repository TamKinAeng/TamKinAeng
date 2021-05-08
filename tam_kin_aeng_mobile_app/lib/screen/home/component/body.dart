import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/models/RecipeBundle.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';

import 'recipe_bundle_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('RecipeBundle').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading...');
          }
          return SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: SizeConfig.defaultSize * 1.5,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) => RecipeBundleCard(
                        index: snapshot.data.docs[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
