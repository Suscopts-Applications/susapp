import 'package:flutter/material.dart';


Container Notes() {
  return Container(
    width: 130,
    height: 100,
    child: Card(
      child: Wrap(
        children: <Widget>[
          Title(color: Colors.white, child: Text("Notes Page"))        
        ],
      ),
    ),
  );
}