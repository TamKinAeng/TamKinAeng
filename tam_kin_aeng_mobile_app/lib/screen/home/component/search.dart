import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tam_kin_aeng_mobile_app/constants.dart';
import 'package:tam_kin_aeng_mobile_app/screen/recipe/RecipePage.dart';

import '../../../size_config.dart';

class DataSearch extends StatefulWidget {
  @override
  _DataSearchState createState() => _DataSearchState();
}

class _DataSearchState extends State<DataSearch> {
  final TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExecuted = false;
  double defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    Widget searchData() {
      return ListView.builder(
          itemCount: snapshotData.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeScreen(
                              recipeIndex: snapshotData.docs[index],
                            )));
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(snapshotData.docs[index].data()['imgUrl']),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  snapshotData.docs[index].data()['name'],
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: defaultSize * 2, //20
                  ),
                ),
                subtitle: Text(snapshotData.docs[index].data()['chef'],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: defaultSize * 1.5, //15
                    )),
              ),
            );
          });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        backgroundColor: kPrimaryColor,
        onPressed: () {
          setState(() {
            isExecuted = false;
            searchController.clear();
          });
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (val) {
              return IconButton(
                icon: SvgPicture.asset("assets/icons/search.svg"),
                onPressed: () {
                  val.queryData(searchController.text).then((value) {
                    snapshotData = value;
                    setState(() {
                      isExecuted = true;
                    });
                  });
                },
              );
            },
          )
        ],
        title: TextField(
          style: TextStyle(color: kPrimaryColor),
          decoration: InputDecoration(
              hintText: 'Search Recipe',
              hintStyle: TextStyle(color: kPrimaryColor)),
          controller: searchController,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isExecuted
          ? searchData()
          : Container(
              child: Center(
                child: Text(
                  'Search any recipe',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: defaultSize * 4,
                  ),
                ),
              ),
            ),
    );
  }
}

class DataController extends GetxController {
  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
        await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('Recipe')
        .where('name', isGreaterThanOrEqualTo: queryString)
        .where('name', isLessThanOrEqualTo: queryString + '\uf8ff')
        .get();
  }
}
