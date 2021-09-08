// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DataSearch extends SearchDelegate<String> {
  final searches = ["god is Great", "grade 1", "lesson 1.2", "lesson1.3", "lesson 1.4", "grade 2","lesson2.1","lesson 2.2","lesson 2.3"];
  final recentsearches = ["God is Great","lesson 1.2","lesson 2.4"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
    // throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionlist = query.isEmpty
        ? recentsearches
        : searches.where((element) => element.contains(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.book),
        title: Text(suggestionlist[index]),
      ),
      itemCount: suggestionlist.length,
    );
  }
}