import 'package:flutter/material.dart';
import 'package:worknow/home/cv_screen.dart';
import 'package:worknow/home/information_screen.dart';
import 'package:worknow/home/works_screen.dart';
import 'package:worknow/home/tab_screen.dart';

class Router {
  static final Map<String, Widget Function(BuildContext)> routes = {
    // Welcome Screen
    TabsScreen.routeName: (ctx) => TabsScreen(),
    // Home Screens
  };
}