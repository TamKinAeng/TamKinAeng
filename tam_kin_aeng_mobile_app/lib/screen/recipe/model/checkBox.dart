import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class IngredientCheck {
  String title;
  bool value;

  IngredientCheck({
    @required this.title,
    this.value = false,
  });
}