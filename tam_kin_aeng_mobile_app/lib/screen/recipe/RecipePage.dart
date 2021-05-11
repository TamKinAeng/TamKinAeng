import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/component/search.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/ingredientChecklist.dart';
import 'package:tam_kin_aeng_mobile_app/screen/register/firebase.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/component/layout.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/CookingPage.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/ingredientCheckbox.dart';
import 'package:tam_kin_aeng_mobile_app/providers/database.dart';
import 'component/ShowComment.dart';
import 'model/ingredientDatabase.dart';

class RecipeScreen extends StatefulWidget {
  final DocumentSnapshot recipeIndex;
  const RecipeScreen({Key key, this.recipeIndex}) : super(key: key);

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  bool isFavourite = false;
  String _userId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserIdAndFav();
  }
   
  Future<void> getUserIdAndFav() async {
await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async{
        dynamic isFav = await DatabaseService(uid: event.uid,foodid: widget.recipeIndex.id).getFavorite;
        setState(() {
          _userId = event.uid;
          isFavourite = isFav['isFavorite'];
        });
        print(event.uid);
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
            .collection('Recipe')
            .doc(widget.recipeIndex.id)
            .snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
         if (snapshot.hasData) {
            var recipes = snapshot.data.data();
        return Scaffold(
           bottomNavigationBar: MyBottomNavBar(),
           floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color.fromRGBO(60, 9, 108, 1),
          label: Text("Start Cooking!!"),
          onPressed: () {
            // go to cookingStep
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IngredientChecklist(
                    RecipeDB: widget.recipeIndex,
                  ),
                ));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          appBar: AppBar(
            // This is icons and logo on our app bar
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // On Android by default its false
        centerTitle: true,
        title: Image.asset(
          "assets/images/logoRevised.png",
          height: defaultSize * 4,
        ),
        actions: <Widget>[
          // Search Button
          Row(
            children: [
              IconButton(
                icon: isFavourite ?Icon(Icons.favorite, color: Colors.red, size: 30.0,):Icon(Icons.favorite_border_rounded,color: Colors.grey[700], size: 30.0,),
                onPressed: () {
                  setState(() {
                    isFavourite = !isFavourite;
                    DatabaseService(uid: _userId).setFavorite(widget.recipeIndex.id, isFavourite);
                    
                    print(widget.recipeIndex.id);
                   
                  });    
                },
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/search.svg"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DataSearch()));
                },
              ),
            ],
          ),
          SizedBox(
            // It means 5 because by out defaultSize = 10
            width: SizeConfig.defaultSize * 0.5,
          )
        ]),
                  // child: Center(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Food name
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text(recipes['name'],
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 32,
                                )))),
                        // Chef
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text("Chef: " + recipes['chef'],
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                )))),
                        Container(
                            margin: EdgeInsets.all(5),
                            child: Image.network(recipes['imgUrl'])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                child: Row(
                              children: [
                                if (recipes['dificulty'] == "low")
                                  SvgPicture.asset(
                                    "assets/icons/low_grey.svg",
                                    height: defaultSize * 2,
                                  ),
                                if (recipes['dificulty'] == "medium")
                                  SvgPicture.asset(
                                    "assets/icons/med_grey.svg",
                                    height: defaultSize * 2,
                                  ),
                                Text(" "+recipes['dificulty']+" level",
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                      fontSize: 16,
                                    ))),
                              ],
                            )),
                            Container(
                                child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/timer.png",
                                  height: defaultSize * 2,
                                ),
                                Text(" "+recipes['time'] + " Minutes",
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                      fontSize: 16,
                                    ))),
                              ],
                            )),
                            Container(child: Text(""),),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Description',
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                        fontSize: 18,
                                      )))
                                ])),
                        // Description content
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(recipes['description'],
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey,
                                          ))))
                                ])),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Ingredient',
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                        fontSize: 18,
                                      )))
                                ])),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height / 4,
                            child: ListIngredient(RecipeDB: widget.recipeIndex)),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Review & Comment',
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                        fontSize: 18,
                                      )))
                                ])),
                        Container(
                          height: MediaQuery.of(context).size.height / 4,
                          child: CommentList(
                            CommentDB: widget.recipeIndex,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 12,
                        ),
                      ],
                    ),
                  ),
                  // )
                );
         }
      }
    );
  }

  AppBar buildAppBar(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return AppBar(
        // This is icons and logo on our app bar
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // On Android by default its false
        centerTitle: true,
        title: Image.asset(
          "assets/images/logoRevised.png",
          height: defaultSize * 4,
        ),
        actions: <Widget>[
          // Search Button
          Row(
            children: [
              IconButton(
                icon:isFavourite ?Icon(Icons.favorite, color: Colors.red,size: 30.0,):Icon(Icons.favorite_border_rounded,color: Colors.grey[700],size: 30.0,),
                onPressed: () {
                 print("1");
                 setState(() {
                   isFavourite = !isFavourite;
                 });
                },
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/search.svg"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DataSearch()));
                },
              ),
            ],
          ),
          SizedBox(
            // It means 5 because by out defaultSize = 10
            width: SizeConfig.defaultSize * 0.5,
          )
        ]);
  }
}
