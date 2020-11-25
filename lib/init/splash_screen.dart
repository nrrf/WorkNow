import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worknow/home/tab_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash-screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TabsScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor, body: _splashbody());
  }

  Widget _splashbody() {
    return SafeArea(
        child: new Center(
      child: Image.asset('assets/splash/splashimagegrande.png',
          width: MediaQuery.of(context).size.width),
    ));
  }
}
