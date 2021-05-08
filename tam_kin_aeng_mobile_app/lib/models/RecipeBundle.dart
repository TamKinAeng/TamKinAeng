import 'package:flutter/material.dart';

class RecipeBundle {
  final int id, recipes;
  final String title, description, imageSrcs;
  final Color color;

  RecipeBundle(
      {this.id,
      this.recipes,
      this.title,
      this.description,
      this.imageSrcs,
      this.color});
}

//Demo List
List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    recipes: 95,
    title: "Cook Something New Everyday",
    description: "New and tasty recipes every minute",
    imageSrcs: "assets/images/cook_new@2x.png",
    color: Color(0xFFD82D40),
  ),
  RecipeBundle(
    id: 2,
    recipes: 26,
    title: "Best of 2020",
    description: "Cook recipes for special occasions",
    imageSrcs: "assets/images/best_2020@2x.png",
    color: Color(0xFF90AF17),
  ),
  RecipeBundle(
    id: 3,
    recipes: 43,
    title: "Food Court",
    description: "What's your favorite food dish make it now",
    imageSrcs: "assets/images/food_court@2x.png",
    color: Color(0xFF2DBBD8),
  ),
];
