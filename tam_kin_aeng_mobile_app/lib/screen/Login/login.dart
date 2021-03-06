import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_button.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_input.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_password_input.dart';
import 'package:tam_kin_aeng_mobile_app/constants.dart';
import 'package:tam_kin_aeng_mobile_app/screen/register/register.dart';
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
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
        body: SingleChildScrollView(
          child: 
          Stack(children: <Widget>[
          Container(
            width: queryData.size.width,
            height: queryData.size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Login_Edited.png"),
            fit: BoxFit.cover,
            ),
            ),
            ),
        //Login Form
        Align(
        alignment: Alignment.center,
        // child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 90),
                  Text(
                    'Welcome to TamKinAeng',
                    style: GoogleFonts.righteous(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Please login before you can access the main page',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                      ))),
                  SizedBox(height: 5),
                  RoundedInput(
                    icon: Icons.mail,
                    controller: _email,
                    hint: 'E-mail Address',
                  ),
                  RoundedPasswordInput(controller: _password, hint: 'Password'),
                  SizedBox(height: 5),
        
                  SizedBox(height: 10),
                  RoundedButton(
                    title: 'Login',
                    email: _email,
                    password: _password,
                    pagelink: HomeScreen(),
                    formkey: _formKey,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ? ",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 15, 
                            color: Colors.white
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return registerScreen();
                          }));
                        },
                        child: Text(
                          "Sign up!",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontSize: 17.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      )
                    ],
                  )
                ]),
          ),
        )),
      // ),
    ]),));
  }
}
