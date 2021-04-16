import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/constants.dart';

import '../screen/home/home_screen.dart';

class RoundedButton extends StatelessWidget {
  
  const RoundedButton({
    Key key,
    @required this.title,
    this.pagelink,
    this.formkey,
  }) : super(key: key);

  final String title;
  final Widget pagelink;
  final GlobalKey<FormState> formkey;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        if (formkey.currentState.validate()){
          Navigator.push(context, MaterialPageRoute(builder: (context) => this.pagelink));
        }else{
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