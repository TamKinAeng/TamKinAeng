import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_button.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_input.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_password_input.dart';

import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
            child: Form(
              key: _formKey,
                          child: Container(
          width: size.width,
          height: defaultLoginSize,
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/BakingCakes1.svg',
                      width: 100, height: 200),
                  Text(
                    'Welcome to TamKinAeng',
                    style: GoogleFonts.righteous(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Please login before you can access the main page',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontSize: 12,
                      ))),
                  SizedBox(height: 10),
                  RoundedInput(icon: Icons.mail, controller: _email, hint: 'E-mail Address',),
                  RoundedPasswordInput(controller: _password, hint: 'Password'),
                  SizedBox(height: 10),
                  Text(
                    'Forgot Password?',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      fontSize: 12,
                    )),
                  ),
                  SizedBox(height: 10),
                  RoundedButton(title:'Login',email: _email.text, password: _password.text ,pagelink: HomeScreen(), formkey: _formKey,),
                  SizedBox(height: 20),
                  Text("I don't have an account Sign up!"
                  ),
                ]),
        ),
            )),
      )
    ]));
  }
}