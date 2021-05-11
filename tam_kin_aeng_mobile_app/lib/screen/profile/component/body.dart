import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/screen/profile/component/profile_menu_item.dart';
import '../../../size_config.dart';
import 'info.dart';
import 'package:tam_kin_aeng_mobile_app/screen/register/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tam_kin_aeng_mobile_app/screen/Login/login.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context)  {
     return FutureBuilder<Map<String,String>>(
      future: getUserInfo(),
      builder: (context, snapshot) {
        print(snapshot.data); 
        if(!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Info(
                image: "assets/images/ios_large_1531731534_image.jpg",
                name: "${snapshot.data["firstname"]} ${snapshot.data["lastname"].toString()}"/* "Platelet Approve Dis EHE" */  ,
                email: snapshot.data["email"].toString()/* "PlateletIsHorny@242517.com" */,
              ),
              SizedBox(
                height: SizeConfig.defaultSize * 2, //20
              ),
              ProfileMenuItem(
                iconSrc: "assets/icons/bookmark_fill.svg",
                title: "Saved Recipes",
                press: () {},
              ),
              ProfileMenuItem(
                iconSrc: "assets/icons/chef_color.svg",
                title: "Super Plan",
                press: () {},
              ),
              ProfileMenuItem(
                iconSrc: "assets/icons/language.svg",
                title: "Change language",
                press: () {},
              ),
              ProfileMenuItem(
                iconSrc: "assets/icons/info.svg",
                title: "Help",
                press: () {},
              ),
              ProfileMenuItem(
                iconSrc: "assets/icons/logout-1.svg",
                title: "Login Out",
                press: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                  print("Logout success");
                },
              )
            ],
          ),
         );
      });
      }
}
