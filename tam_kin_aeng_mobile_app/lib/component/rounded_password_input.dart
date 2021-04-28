import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/component/input_container.dart';

import '../constants.dart';

class RoundedPasswordInput extends StatefulWidget {
  RoundedPasswordInput({
    Key key,
    @required this.hint,
    @required this.controller,
  }) : super(key: key);

  String hint;
  bool isError = false;
  TextEditingController controller;
  @override
  _RoundedPasswordInputState createState() => _RoundedPasswordInputState();
}

class _RoundedPasswordInputState extends State<RoundedPasswordInput> {
  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextFormField(
          controller: widget.controller,
          validator: (value) {
            if (value == null || value.isEmpty){
              setState(() {
                widget.isError = true;
                widget.hint = "Please enter your password";
              });
              return "";
            }
            return null;
          },
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock, color: kPrimaryColor),
          hintText: widget.hint,
          hintStyle: TextStyle(color: widget.isError? Colors.red: Colors.black54),
          border: InputBorder.none
        ),
      ),);
  }
}
