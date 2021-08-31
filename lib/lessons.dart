import 'package:flutter/material.dart';



Container Lessons(String imageval, String heading, String subhead) {
  return Container(
    width: 130,
    height: 100,
    child: Card(
      child: Wrap(
        children: <Widget>[
          Title(color: Colors.white, child: Text("Lessons Page")),
          Image.network(imageval, fit: BoxFit.cover),
          ListTile(
            title: Text(heading,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            subtitle: Text(
              subhead,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
          )
        ],
      ),
    ),
  );
}