import 'package:flutter/material.dart';

import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Categories(),
      ],
    );
  }
}
