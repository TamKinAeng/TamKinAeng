import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tam_kin_aeng_mobile_app/constants.dart';
import 'package:tam_kin_aeng_mobile_app/models/RecipeBundle.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';

import 'categories.dart';
import 'recipe_bundle_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Categories(),
        RecipeBundleCard(),
      ],
    );
  }
}
