// Flutter code sample for BottomNavigationBar
//
// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has four [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.shifting], and
// the [currentIndex] is set to index 0. The selected item is amber in color.
// With each [BottomNavigationBarItem] widget, backgroundColor property is
// also defined, which changes the background color of [BottomNavigationBar],
// when that item is selected. The `_onItemTapped` function changes the
// selected item's index and displays a corresponding message in the center of
// the [Scaffold].

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sus_sunday_school/grades_lessons_lists.dart';

import 'lessons.dart';
import 'search_model.dart';
// import 'lessons.dart';
import 'grades_card.dart';
import 'last_read.dart';
import 'notes.dart';
// import 'settings.dart';
import 'grades_lessons_lists.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  final screens = [
    home_nav(),
    //Lessons("images/grade 1.JPG", "1.1", "Holy Family"),
    Last_Read(),
    MainPage(),
    // Settings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// Main build & application landing & Bottom routing
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Curriculum '),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(Icons.search))
        ],
      ),
      // drawer: Drawer(),
      body: screens[_selectedIndex],

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.play_lesson), label: 'Lessons'),
          BottomNavigationBarItem(
              icon: Image.network("images/grade 1.JPG"), label: 'Last Read'
              // activeIcon: Image.network("images/grade 1.JPG"),
              ),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Notes'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

Container home_nav() {
  return Container(
      child: new ListView(
    children: <Widget>[
      for (var item in grades_keys)
        mygrades_row(item['grade_header'], "See All", item["cards"]),
    ],
  ));
}
