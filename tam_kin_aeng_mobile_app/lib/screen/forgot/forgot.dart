import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_button.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_input.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_password_input.dart';
import 'package:tam_kin_aeng_mobile_app/screen/Login/login.dart';
import 'package:tam_kin_aeng_mobile_app/component/input_container.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
class forgotScreen extends StatefulWidget {
  @override
  
  _forgotScreenState createState() => _forgotScreenState();
}

class _forgotScreenState extends State<forgotScreen> {
  @override
  String _email;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildEmailField() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (String value) {
          if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
              .hasMatch(value)) {
            return 'Please enter a vaild email address';
          } else
            return null;
        },
        onSaved: (String value) {
          _email = value;
        });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
        body: Container(
            margin: EdgeInsets.all(24),
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Forgot your password?',
                      style: GoogleFonts.righteous(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Enter your registered email to recieves instructions on how to reset your password",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 12,
                        ))),
                    _buildEmailField(),

                    SizedBox(height: 10),
                    RaisedButton(
                        child: Text
                        ('Recover',
                            style: TextStyle(color: Colors.red, fontSize: 16)),
                        onPressed: () async {
                          print(_formKey.currentState.validate());
                          if (_formKey.currentState.validate()) {
                            try
                             {
                              FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                              await _firebaseAuth
                                  .createUserWithEmailAndPassword(
                                email: _email,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            } on FirebaseAuthException catch (e) {
                              print(e.message);
                            }

                            _formKey.currentState.save();

                            print(_email);
                          } else {
                            print("hello12");
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('There was an error')));
                          }
                        })
                  ]),
            )));
  }
}
AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // This is icons and logo on our app bar
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          //back icon go back to add recipe body
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));},
        ),
        // On Android by default its false
        centerTitle: true,
        title: Image.asset("assets/images/logo.png"),
        actions: <Widget>[
          SizedBox(
            // It means 5 because by out defaultSize = 10
            width: 0.5,
          )
        ]);
  }