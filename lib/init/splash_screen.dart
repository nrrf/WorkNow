import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: _splashbody()
    );
  }

  Widget _splashbody(){
    return SafeArea(
      child: Center(
        child: SvgPicture.asset('assets/splash/Grupo_40.svg',
                 width: 150, 
                 height: 150
              ),
      )
    );
  }
}