import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeCateDetail {
  final int id;
  final String name, description, cuisine, imageSrcs;
  final CollectionReference recipeCollection =
      FirebaseFirestore.instance.collection('Recipe');

  RecipeCateDetail(
      {this.name, this.description, this.cuisine, this.imageSrcs, this.id});
}

//Demo List
List<RecipeCateDetail> recipeCateDetails = [
  RecipeCateDetail(
    name: "Sanwich",
    description: "Very wholesome",
    cuisine: "indian",
    imageSrcs: "assets/images/sandwich.png",
    id: 1,
  ),
  RecipeCateDetail(
    name: "Naporitan",
    description: "Nice haircut, sir",
    cuisine: "italian",
    imageSrcs: "assets/images/Naporitan.jpg",
    id: 2,
  ),
  RecipeCateDetail(
    name: "Gamberi Spaghetti",
    description:
        "asdsadbfjadsfvgabdsvghfvbdjsabfvhdsabvfasvdfvadgsvfghdsvfdabsvhjfbvdjsfvghdsvfghadsvfghadsvghfvadsghfvdghsvghfdsvfghdvghfvghfvgfvdghsvghvf",
    cuisine: "italian",
    imageSrcs: "assets/images/Spaghetti-gamberi.png",
    id: 3,
  ),
  RecipeCateDetail(
    name: "Pizza",
    description: "Just pizza nothing more nothing less",
    cuisine: "italian",
    imageSrcs: "assets/images/Italian_pizza.png",
    id: 4,
  ),
];

List<RecipeCateDetail> blank = [];
