import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRecipeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
            margin: EdgeInsets.all(10),
            child: Text('Add Recipe',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 32,
                    )))),

      ]
      ),
    );
  }
}
