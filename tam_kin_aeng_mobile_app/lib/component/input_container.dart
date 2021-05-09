import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/constants.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      width: size.width*0.8,
      height: size.height*0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white
      ),

      child: child,
    );
  }
}