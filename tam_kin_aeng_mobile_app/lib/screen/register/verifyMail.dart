import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/screen/Login/login.dart';
import 'package:tam_kin_aeng_mobile_app/constants.dart';

class verifyScreen extends StatefulWidget {
  @override
  _verifyScreenState createState() => _verifyScreenState();
}

class _verifyScreenState extends State<verifyScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double defaultLoginSize = size.height - (size.height * 0.2);
    return Scaffold(
      backgroundColor: kPrimaryColor,
        appBar: buildAppBar(context),
        body: Stack(children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                width: size.width,
                height: defaultLoginSize,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset('assets/images/Form.svg',
                        width: 100, height: 180),
                    Text(
                      'Check your email',
                      style: GoogleFonts.righteous(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 28, color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("We've sent a verification email on your entered",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 14, color: Colors.white
                          
                        ))),
                    Text("email address, please check and verify.",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 14, color: Colors.white
                        ))),
                    SizedBox(height: 10),
                    RaisedButton(
                      color: kSecondaryColor,
                      child: Text(
                          "Back to Home",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(color: Colors.white, fontSize: 18))),
                            
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen())
                        );
                      }
                    )
                  ],
                ),
              )),
        ]));
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    // This is icons and logo on our app bar
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/back.svg", color: Colors.white,),
      //back icon go back to add recipe body
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
    ),
  );
}
