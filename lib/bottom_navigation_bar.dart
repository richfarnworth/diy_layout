import 'package:flutter/material.dart';

class NewBottomNav extends StatefulWidget {
  int selectedPage = 0;
  final Function(int) setPageFunc;

  NewBottomNav({Key? key, required this.selectedPage, required this.setPageFunc}) : super(key: key);
  @override
  State<NewBottomNav> createState() => NewBottomNavState();
}

class NewBottomNavState extends State<NewBottomNav> {
  //final int selectedPage;
  //final Function(int) setPageFunc;
  //NewBottomNavState(this.selectedPage, this.setPageFunc);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).hoverColor,
        selectedItemColor: Theme.of(context).focusColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
        ],
        currentIndex: widget.selectedPage,
        onTap: widget.setPageFunc);
  }
}
