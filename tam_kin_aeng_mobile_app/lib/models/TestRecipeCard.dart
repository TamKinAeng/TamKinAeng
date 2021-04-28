import 'package:flutter/material.dart';

class RecipeDetail {
  final int time;
  final String name, dificulty, imageSrcs;
  final Color color;

  RecipeDetail(
      {this.color, this.time, this.name, this.dificulty, this.imageSrcs});
}

//Demo list
List<RecipeDetail> recipeDetails = [
  RecipeDetail(
    time: 20,
    name: "Berry and Oats Breakfast bowl",
    dificulty: "Med",
    imageSrcs: "assets/images/image_1.png",
    color: Color(0xFFD82D40),
  ),
  RecipeDetail(
    time: 20,
    name: "Green Salad with the Vegetables",
    dificulty: "Med",
    imageSrcs: "assets/images/image_2.png",
    color: Color(0xFF90AF17),
  ),
];
