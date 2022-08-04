import 'package:flutter/material.dart';

import "properties.dart";
import "property_page.dart";
import "theme.dart";
import "bottom_navigation_bar.dart";

import "pages.dart";
import "project_page.dart";

import "schema.dart";

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override //For stateful widget override createState.
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  int _selectedPage = 1;
  dynamic pages;

  void setPage(int pageIndex) {
    setState(() {
      _selectedPage = pageIndex;
    });
  }

  _MyAppState() : super() {
    pages = [
      PropertyPage(),
      ProjectPage(),
      SwitchPage3(setPage)
    ];
  }

  @override
  Widget build(BuildContext context) {
    setupDB();
    return MaterialApp(
      theme: mainTheme,
      home: Scaffold(
        appBar: AppBar(title: Text(pageTitles[_selectedPage]), backgroundColor: mainTheme.primaryColor, foregroundColor: Colors.black),
        body: pages[_selectedPage],
        drawer: const ListProperties(),
        bottomNavigationBar: NewBottomNav(selectedPage: _selectedPage, setPageFunc: setPage),
      ),
    );
  }
}
