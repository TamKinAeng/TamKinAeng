import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      // child: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                child: Text('Food Name',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      fontSize: 32,
                    )))),
            Container(
                margin: EdgeInsets.all(10),
                child: Text('Chef',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      fontSize: 16,
                    )))),
            Container(
                margin: EdgeInsets.all(5),
                child: Image.asset('assets/images/Food1.png')),
            Container(
                margin: EdgeInsets.all(10),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text('Description',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontSize: 18,
                      )))
                ])),
            Container(
                margin: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                          child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                              ))))
                    ])),
            Container(
                margin: EdgeInsets.all(10),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text('Ingredient',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontSize: 18,
                      )))
                ])),
            Container(
                margin: EdgeInsets.all(5),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text('Item1',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 14,
                        )))
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text('Item2',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 14,
                        )))
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text('Item3',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 14,
                        )))
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text('Item4',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 14,
                        )))
                  ]),
                ])),
          ],
        ),
      ),
      // )
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RaisedButton(
        onPressed: () {},
        child: const Text('Bottom Button!', style: TextStyle(fontSize: 20)),
        color: Colors.blue,
        textColor: Colors.white,
        elevation: 5,
      ),
    );
  }
}