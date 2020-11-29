import 'package:flutter/material.dart';

import 'package:worknow/home/cv_screen.dart';
import 'package:worknow/home/information_screen.dart';
import 'package:worknow/home/works_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = '/tab-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  List<Map<String, Object>> _pages = [
    {'page': WorksScreen()},
    {'page': InformationScreen()},
    {'page': CvScreen()},
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: SafeArea(
          child: _pages[_selectedPageIndex]['page'],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          child: BottomNavigationBar(
            onTap: _selectPage,
            currentIndex: _selectedPageIndex,
            backgroundColor: Theme.of(context).primaryColor,
            fixedColor: Theme.of(context).accentColor,
            iconSize: 40,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/briefcase.svg',
                    width: 50, height: 50),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/tools.svg',
                    width: 50, height: 50),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/file.svg',
                    width: 50, height: 50),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
