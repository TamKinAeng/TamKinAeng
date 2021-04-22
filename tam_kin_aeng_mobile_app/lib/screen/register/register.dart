import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/component/rounded_button.dart';
import '../home/home_screen.dart';
import 'package:flutter/src/material/raised_button.dart';

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
    return TextFormField(
      decoration: InputDecoration(labelText:  'Email'),
      validator: (String value){

        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+").hasMatch(value)){
          return 'Please enter a vaild email address';
        } else
        return null;
      },
      onSaved: (String value) {
        _email = value;
      }
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(labelText:  'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value){
        if(value.isEmpty){
          return 'Please enter a Password';
        } else
        return null;
      },
      onSaved: (String value) {
        _password = value;
      }
    );
  }

  Widget _buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText:  'Firstname'),
      validator: (String value){
        if(value.isEmpty){
          return 'Firstname is Required';
        } else
        return null;
      },
      onSaved: (String value) {
        _firstname = value;
      }
    );
  }

  Widget _buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText:  'Lastname'),
      validator: (String value){
        if(value.isEmpty){
          return 'Lastname is Required';
        } else
        return null;
      },
      onSaved: (String value) {
        _firstname = value;
      }
    );
  }

  Widget _buildGenderField() {
    return TextFormField(
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
    );
    /* Scaffold(
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: DropdownButton(
              value: _gender,
              items: [
                DropdownMenuItem(
                  child: Text("Male"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Female"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("Other"),
                  value: 3
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              }),
        )); */
}

  Widget _buildBirthDateField() {
    return TextFormField(
      decoration: InputDecoration(labelText:  'Birthdate'),
      validator: (String value){
        if(value.isEmpty){
          return 'Birthdate is Required';
        } else
        return null;
      },
      onSaved: (String value) {
        _birthdate= value;
      }
    );
    /* Scaffold(
      body:  Column(
        children: <Widget>[
          Text(_birthdate == null ? 'Nothing has been picked yet' : _birthdate.toString()),
          RaisedButton(
            child: Text('Pick a date'),
            onPressed: (){
              showDatePicker(
                context: context, 
                initialDate: DateTime.now(),
                firstDate: DateTime(1990), 
                lastDate: DateTime(2222)
                ).then((date){
                  setState(() {
                    _birthdate = date;
                  });
                });
            },
            )
        ],
      ),
    ); */
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Join us!',
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
                    _buildEmailField(),
                    _buildPasswordField(),
                    _buildFirstNameField(),
                    _buildLastNameField(),
                    _buildGenderField(),
                    _buildBirthDateField(),
                  SizedBox(height: 10),
                  RaisedButton(
                    child: Text('Submit',
                    style: TextStyle(color: Colors.red, fontSize: 16)
                    ),
                    onPressed: () {
                      if(!_formKey.currentState.validate()){
                        return;
                      }

                      _formKey.currentState.save();
                      
                      print(_email);
                      print(_password); 
                      print(_firstname);
                      print(_lastname);
                      print(_gender);
                      print(_birthdate);
                    } 
                    )
                  ]
                  ),
                  ))
    );
  }
}
