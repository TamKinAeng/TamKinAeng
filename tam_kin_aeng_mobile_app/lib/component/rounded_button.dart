import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tam_kin_aeng_mobile_app/constants.dart';
import '../screen/home/home_screen.dart';

class RoundedButton extends StatelessWidget {
  
  const RoundedButton({
    Key key,
    @required this.title,
    this.pagelink,
    this.formkey,
    this.email,
    this.password,
  }) : super(key: key);

  final String title;
  final Widget pagelink;
  final String email;
  final String password;
  final GlobalKey<FormState> formkey;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () async {
        print(formkey.currentState.validate());
        print("hello");
        if (!formkey.currentState.validate()){
          try { FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
          print("hello");
          print(email);
          print(password);
            await _firebaseAuth.signInWithEmailAndPassword(
              email: email, 
              password: password
              );
               Navigator.push(context, MaterialPageRoute(builder: (context) => this.pagelink));
          } on FirebaseAuthException catch (e){
            ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('There was an error')));
          }
        }else{
          print("hello12");
          ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('There was an error')));
        }
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width*0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor,
        ),

        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Text(
          this.title,
          style: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        ),
      ),
      ),
      );
  }
}