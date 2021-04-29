import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';

class favouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/logoRevised.png', height: 37),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Favourite',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF2B2B2B),
                        fontWeight: FontWeight.bold))),
          )
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
