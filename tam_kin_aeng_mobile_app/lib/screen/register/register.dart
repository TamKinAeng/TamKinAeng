import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_button.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_input.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_password_input.dart';

class registerScreen extends StatefulWidget {
  @override
  _registerScreenState createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // We are using this to determine Keyboard is opened or not
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);
    return Scaffold(
        body: Stack(children: [
      //Login Form
      Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Container(
          width: size.width,
          height: defaultLoginSize,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Join Us!',
                  style: GoogleFonts.righteous(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text("If you don't have account, you can register now",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      fontSize: 12,
                    ))),
                SizedBox(height: 10),
                RoundedInput(icon: Icons.mail, hint: 'E-mail Address'),
                RoundedPasswordInput(hint: 'Password'),
                RoundedInput( hint: 'Firstname'),
                RoundedInput( hint: 'Lastname'),
                RoundedInput( hint: 'Gender'),
                RoundedInput( hint: 'Birthdate'),
                SizedBox(height: 10),
                SizedBox(height: 10),
                RoundedButton(title: 'Register'),
                SizedBox(height: 20),
              ])),
        )),
    ]));
  }
}
