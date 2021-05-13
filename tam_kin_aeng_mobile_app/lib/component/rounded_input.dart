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

  FocusNode myFocusNode = new FocusNode();

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

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
                widget.hint = "Enter a valid email";
              });
            }
            return null;
          },
        cursorColor: kPrimaryColor,
        focusNode: myFocusNode,
        decoration: InputDecoration(
          icon: Icon(widget.icon, color: kPrimaryColor),
          hintText: widget.hint,
          hintStyle: TextStyle(color: widget.isError? Colors.red: Colors.black54),
          border: InputBorder.none
        ),
        onTap: () => {
            setState(() {
              FocusScope.of(context).requestFocus(myFocusNode);
            })
          },
          onEditingComplete: () => {
            setState(() {
              myFocusNode.nextFocus();
            })
          },
      ),);
  }
}
