import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/component/body.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';

import 'package:tam_kin_aeng_mobile_app/screen/addRecipe/addRecipe.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          sLineTextField(),
          mLineTextField(),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }



// Refactor -> Extract method from AppBar
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // This is icons and logo on our app bar
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          //back icon go back to add recipe body
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddRecipe()));},
        ),
        // On Android by default its false
        centerTitle: true,
        title: Image.asset("assets/images/logo.png"),
        actions: <Widget>[
          SizedBox(
            // It means 5 because by out defaultSize = 10
            width: SizeConfig.defaultSize * 0.5,
          )
        ]);
  }
}

// Multi-line text field widget for description
// StatefulWidget is a widget that has mutable state.
class mLineTextField extends StatefulWidget {
  mLineTextField({Key key}) : super(key: key);

  @override
  createState() => _MultiTextFieldState();

}
class sLineTextField extends StatefulWidget {
  sLineTextField({Key key}) : super(key: key);

  @override
  createState() => _SingleTextFieldState();

}
// It is the logic for 'StatefulWidget'
class _MultiTextFieldState extends State<mLineTextField> {

  final TextEditingController _multilineTextFieldcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Description',
            ),
          )
        ],
      ),
    );
  }
}
class _SingleTextFieldState extends State<sLineTextField> {

  final TextEditingController _singleTextFieldcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Food Name',
            ),
          )
        ],
      ),
    );
  }
}

