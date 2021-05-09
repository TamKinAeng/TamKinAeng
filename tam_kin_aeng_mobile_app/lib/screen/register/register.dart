import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_button.dart';
import 'package:tam_kin_aeng_mobile_app/screen/Login/login.dart';
import 'package:flutter/src/material/raised_button.dart';
import 'package:tam_kin_aeng_mobile_app/constants.dart';
import 'package:tam_kin_aeng_mobile_app/screen/register/firebase.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:tam_kin_aeng_mobile_app/component/input_container.dart';

class registerScreen extends StatefulWidget {
  @override
  _registerScreenState createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  @override
  String _email;
  String _password;
  String _firstname;
  String _lastname;
  String _gender;
  String _birthdate;
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildEmailField() {
     Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      width: size.width*1,
      height: size.height*0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white
        
      ),
    child: TextFormField(
        decoration: InputDecoration( hintText: 'Email',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.email,
             color: kPrimaryColor
             )
             ),
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
        }
        )
    );
  }
  Widget _buildPasswordField() {
   Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      width: size.width*1,
      height: size.height*0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white
      ),
      child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Password',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.lock,
            color: kPrimaryColor
            )
            ),
          keyboardType: TextInputType.visiblePassword,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please enter a Password';
            } else
              return null;
          },
          onSaved: (String value) {
            _password = value;
          }),
    );
  }

  Widget _buildFirstNameField() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      width: size.width*1,
      height: size.height*0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white
      ),
      child: TextFormField(
          decoration: InputDecoration(
             hintText: 'Firstname',
            border: InputBorder.none
            ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Firstname is Required';
            } else
              return null;
          },
          onSaved: (String value) {
            _firstname = value;
          }),
    );
  }

  Widget _buildLastNameField() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      width: size.width*1,
      height: size.height*0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white
      ),
    child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Lastname',
          border: InputBorder.none
          ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Lastname is Required';
          } else
            return null;
        },
        onSaved: (String value) {
          _lastname = value;
        }));
  }

  Widget _buildGenderField() {
    return /* TextFormField(
      decoration: InputDecoration(labelText:  'Gender'),
      validator: (String value){
        if(value.isEmpty){
          return 'Gender is Required';
        } else
        return null;
      },
      onSaved: (String value) {
        _gender= value;
      }
    ); */

        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(borderRadius: new BorderRadius.circular(40.0),
          color: Colors.white
          ),
          
      child: new DropdownButton(
        iconEnabledColor: Colors.white,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(color: Colors.black, fontSize: 18)),
          underline: Container(
          height: 2,
          color: kSecondaryColor),
          hint: Text("Gender"),
          icon: Icon(Icons.arrow_downward, color: kSecondaryColor,),
          value: _gender,
          items: [
            DropdownMenuItem(
              child: Text("Male"),
              value: "Male",
            ),
            DropdownMenuItem(
              child: Text("Female"),
              value: "Female",
            ),
            DropdownMenuItem(
              child: Text("Other"),
              value: "Other",
            ),
          ],
          onChanged: (value) {
            setState(() {
              _gender = value;
            });
          }),
    );
  }

  Widget _buildBirthDateField() {
    return Column(
      children: <Widget>[
        RaisedButton(
          color: kSecondaryColor,
          child:
              Text(_birthdate == null ? 'Pick Birthdate' : _birthdate.toString(),
              style: GoogleFonts.roboto(
                textStyle: TextStyle(color: Colors.white, fontSize: 18)
              ),),
          onPressed: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2222))
                .then((date) {
              setState(() {
                _birthdate = date.toString().substring(0, 10);
              });
            });
          },
        ),
      ],
      
    );
  }

  Widget build(BuildContext context) {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
        body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Join us!',
                    style: GoogleFonts.righteous(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28, color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("If you don't have account, you can register now",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontSize: 14, color: Colors.white
                      ))),
                  _buildEmailField(),
                  _buildPasswordField(),
                  _buildFirstNameField(),
                  _buildLastNameField(),
                  _buildGenderField(),
                  _buildBirthDateField(),
                  SizedBox(height: 10),
                  RaisedButton(
                    color: kSecondaryColor,
                    child: Text(
                          "Register",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(color: Colors.white, fontSize: 20))),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          try {
                            print('test');
                            print(_email+"email test test");
                            await _firebaseAuth.createUserWithEmailAndPassword(
                              email: _email,
                              password: _password,                          
                            ).then((value) => print('testinfo'));/*  */
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                            userInfo(_firstname, _lastname, _gender, _birthdate);
                          } on FirebaseAuthException catch (e) {
                            print(e.message);
                          }
                          print(_email);
                          print(_password);
                          print(_firstname);
                          print(_lastname);
                          print(_gender);
                          print(_birthdate);
                        } else {
                          print("hello12");
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('There was an error')));
                        }
                      })
                ]),
          )),
    ));
  }
}
AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      // This is icons and logo on our app bar
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg", color: Colors.white),
          //back icon go back to add recipe body
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));},
        ),);
  }

