import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';

class equipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logoRevised.png',
          height: 37,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Learn How to Use',
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF2B2B2B),
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Card(
            color: Color(0xFFD92E40),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 15.0),
            child: Stack(
              children: [
                Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/test.png',
                            width: 310, height: 200)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 115, left: 20),
                  child: Row(
                    children: [
                      Text("Pan ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              fontSize: 18)),
                      Text("(Grill/Fry/Stir)",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                              fontSize: 14))
                    ],
                  ),
                )
              ],
            ),
            elevation: 8,
          ),
          //PotCard
          Card(
            color: Color(0xFF7D9C15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 15.0),
            child: Stack(
              children: [
                Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/pot.png',
                            width: 310, height: 200)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 115, left: 20),
                  child: Row(
                    children: [
                      Text("Pot ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              fontSize: 18)),
                      Text("(Boil/Simmer)",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                              fontSize: 14))
                    ],
                  ),
                )
              ],
            ),
            elevation: 8,
          ),
          //AirFryer
          Card(
            color: Color(0xFF25A1BF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 15.0),
            child: Stack(
              children: [
                Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/airfryer.png',
                            width: 310, height: 200)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 115, left: 20),
                  child: Row(
                    children: [
                      Text("Air Fryer ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              fontSize: 18)),
                      Text("(Broil/Grill/Fry)",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                              fontSize: 14))
                    ],
                  ),
                )
              ],
            ),
            elevation: 8,
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
