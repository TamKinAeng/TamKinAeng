import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:tam_kin_aeng_mobile_app/screen/register/firebase.dart';

class FinishContent extends StatefulWidget {
  final DocumentSnapshot finishDB;

  const FinishContent({Key key, this.finishDB}) : super(key: key);
  @override
  _FinishContentState createState() => _FinishContentState();
}

class _FinishContentState extends State<FinishContent> {
  double defaultSize = SizeConfig.defaultSize;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
              child: Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Container(
                child: Image.asset(
              "assets/images/champion.png",
              height: defaultSize * 20,
            )),
          )),
          Center(
              child: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 6,
            margin: EdgeInsets.all(5),
            child: Center(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  color: Color.fromRGBO(255, 109, 0, 1),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 200),
                    child: Text('Congratulation!!',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                        ))),
                  ),
                )
              ]),
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.cyan,
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  'Review & Comment',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                onPressed: _showRatingAppDialog,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showRatingAppDialog() async {
    final fb = FirebaseFirestore.instance
        .collection('Recipe')
        .doc(widget.finishDB.id)
        .collection('RecipeReview');
    String name;
    FirebaseFirestore.instance
        .collection("Users")
        .doc(await getUID())
        .get()
        .then((querySnapshot) {
      name = querySnapshot.data()["Firstname"];
    });
    double defaultSize = SizeConfig.defaultSize;
    final _ratingDialog = RatingDialog(
      image: Image.asset("assets/images/logoRevised.png",
          height: defaultSize * 10),
      ratingColor: Colors.amber,
      title: 'Like this recipe?',
      message: 'Give some stars and comment for other people'
          ' to see what you think.',
      submitButton: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, '
            'comment: ${response.comment}');
        fb.add({
          'rating': '${response.rating}',
          'comment': '${response.comment}',
          'name': name
        });
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _ratingDialog,
    );
  }
}
