import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRecipeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Column(children: [
        Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Add Recipe',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF2B2B2B),
                      fontWeight: FontWeight.bold
                    )))),

          ]
        ),
      ),
    );
  }
}
