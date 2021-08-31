import 'package:flutter/material.dart';

Container mygrades_card(String imageval, String heading, String subhead) {
  return Container(
    width: 130,
    height: 100,
    child: Card(
      child: Wrap(
        children: <Widget>[
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

Container mygrades_row(String header, String buttontext, List grades) {
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      // color: Colors.grey[300],
      child: Wrap(children: [
        new SizedBox(height: 10),
        new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Text(header,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.left)),
            Expanded(
                child: (ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.play_lesson),
                    label: Text(buttontext),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.amber[800],
                      fixedSize: Size(30, 20),
                    ))))
          ],
        ),
        new Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            height: 150,
            child: new ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var item in grades)
                  mygrades_card(
                      item['imageval'], item['heading'], item['subhead']),
              ],
            )),
        new SizedBox(height: 10)
      ]));
}
