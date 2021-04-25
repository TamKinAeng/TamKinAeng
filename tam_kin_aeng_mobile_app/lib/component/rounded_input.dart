import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/component/input_container.dart';

import '../constants.dart';

class RoundedInput extends StatefulWidget {
   RoundedInput({
    Key key,
    @required this.icon,
    @required this.hint,
    @required this.controller,
  }) : super(key: key);

  IconData icon;
  String hint;
  bool isError = false;
  TextEditingController controller;
  @override
  _RoundedInputState createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextFormField(
          controller: widget.controller ,
         validator: (value) {
            if (value == null || value.isEmpty 
            || RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+").hasMatch(value)){
              setState(() {
                widget.isError = true;
                widget.hint = "Please enter a valid email";
              });
              return "";
            }
            return null;
          },
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(widget.icon, color: kPrimaryColor),
          hintText: widget.hint,
          hintStyle: TextStyle(color: widget.isError? Colors.red: Colors.black54),
          border: InputBorder.none
        ),
      ),);
  }
}
