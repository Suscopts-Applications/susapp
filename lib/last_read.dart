import 'package:flutter/material.dart';

Container Last_Read() {
  return Container(
    width: 130,
    height: 100,
    child: Card(
      child: Wrap(
        children: <Widget>[
          Title(color: Colors.white, child: Text("Last Read Page"))        
        ],
      ),
    ),
  );
}