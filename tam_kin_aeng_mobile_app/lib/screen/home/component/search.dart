import 'package:flutter/material.dart';
import 'package:tam_kin_aeng_mobile_app/constants.dart';

class DataSearch extends SearchDelegate<String> {
  final recipe = [
    "AA",
    "AB",
    "AC",
    "BA",
    "BB",
    "BC",
    "CA",
    "CB",
    "CC",
  ];

  final recentRecipe = [
    "BA",
    "BB",
    "BC",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: kPrimaryColor,
          shape: StadiumBorder(),
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone search for something
    final suggestionList = query.isEmpty
        ? recentRecipe
        : recipe
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.restaurant_menu),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(
                    query.length,
                  ),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
