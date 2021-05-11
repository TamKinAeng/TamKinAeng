import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/providers/database.dart';
import 'package:tam_kin_aeng_mobile_app/screen/forgot/forgot.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/component/recipe_bundle_card.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/favRecipe_card.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';

class favouritePage extends StatefulWidget {
  get recipeIndex => null;

  @override
  _favouritePageState createState() => _favouritePageState();
}

class _favouritePageState extends State<favouritePage> {
  String _userId;
  List<String> favRecipeList;
  @override
  void initState() {
    // TODO: implement initState
    getUserIdAndFav();
    super.initState();
  }

  Future<void> getUserIdAndFav() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        dynamic favList = await DatabaseService(uid: event.uid).myFavRecipes;

        setState(() {
          _userId = event.uid;
          favRecipeList = favList;
        });
        print(event.uid);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var recipeDetail;
    double defaultSize = SizeConfig.defaultSize;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Recipe').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData || favRecipeList == null) {
          return Scaffold(
            appBar: AppBar(
                // This is icons and logo on our app bar
                // leading: IconButton(
                //   icon: SvgPicture.asset("assets/icons/back.svg"),
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                // ),
                // On Android by default its false
                centerTitle: true,
                title: Image.asset(
                  "assets/images/logoRevised.png",
                  height: defaultSize * 4,
                ),
                actions: <Widget>[
                  // Search Button
                  SizedBox(
                    // It means 5 because by out defaultSize = 10
                    width: SizeConfig.defaultSize * 0.5,
                  )
                ]),
            body: Text(""),
            bottomNavigationBar: MyBottomNavBar(),
          );
        } else {
          var repList;
          if (favRecipeList != null) {
            repList = snapshot.data.docs.toList();
            for (int i = 0; i < repList.length; i++) {
              for (int j = 0; j < favRecipeList.length; j++) {
                if (repList[i]['recipe'] == favRecipeList[j]) {
                  repList.remove(repList[i]);
                }
              }
            }
          }

          double defaultSize = SizeConfig.defaultSize;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                // This is icons and logo on our app bar
                // leading: IconButton(
                //   icon: SvgPicture.asset("assets/icons/back.svg"),
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                // ),
                // On Android by default its false
                centerTitle: true,
                title: Image.asset(
                  "assets/images/logoRevised.png",
                  height: defaultSize * 4,
                ),
                actions: <Widget>[
                  // Search Button
                  SizedBox(
                    // It means 5 because by out defaultSize = 10
                    width: SizeConfig.defaultSize * 0.5,
                  )
                ]),
            body:
                // Recipe Card
                SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 160),
                      child: Text(
                        "Favorite Page",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF2B2B2B),
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: MediaQuery.of(context).size.height *
                            (defaultSize * 0.083),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              defaultSize * 0.5, 0, 5, 0), 
                          child: ListView.builder(
                            itemCount: repList.length,
                            itemBuilder: (context, index) => Container(
                              padding: EdgeInsets.only(top: 10),
                              child: FavRecipeCard(
                                recipeDetail: repList.toList()[index],
                                color: (index % 2 == 0)
                                    ? Color(0xFFD92E40)
                                    : Color(0xFF7D9C15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: MyBottomNavBar(),
          );
        }
      },
    );
  }
}
