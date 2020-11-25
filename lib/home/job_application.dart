import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worknow/home/information_screen.dart';
import 'package:expandable/expandable.dart';
import 'dart:math' as math;

const cargo = "Desarrollador Web";
const empresa = "Asertempo";
var existencia = true;

class JobApplicationScreen extends StatefulWidget {
  static const String routeName = '/job-application-screen';
  @override
  _JobApplicationState createState() => _JobApplicationState();
}

class _JobApplicationState extends State<JobApplicationScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: SafeArea(
          child: ExpandableTheme(
            data: const ExpandableThemeData(
              iconColor: Colors.blue,
              useInkWell: true,
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                Text('Historial de Solicitudes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        height: 2,
                        letterSpacing: 2)),
                SizedBox(height: 15),
                Text(
                    "Si tu aplicacion fue aceptada\nrevisa tu celular y/o correo con \nla informacion",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    )),
                SizedBox(height: 15),
                for (var _ in Iterable.generate(
                    5)) // Muy interesante, hace 5 veces Card1()
                  _application(cargo, empresa),
              ],
            ),
          ),
        ));
  }

  Widget _application(cargo, empresa) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: cargo+'\n',
                      
                      style: TextStyle(
                        
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: empresa,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ]),
                ),
                SvgPicture.asset('assets/icons/check_1.svg', width: 50),
              ]),
        ],
      ),
    );
  }
}
