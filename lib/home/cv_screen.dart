import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CvScreen extends StatefulWidget {
  static const String routeName = '/cv-screen';
  @override
  _CvScreenState createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      // safe area nos asegura q no nos vamos a chocar con la parte de notificaciones
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            SvgPicture.asset('assets/icons/file.svg', width: 150, height: 150),
          ]),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'Busca el empleo que se\najuste mas a tus\nnecesidades',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
              ]),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          //_button(button1),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'Revisa si una empresa te\nquiere contratar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
              ]),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          //_button(button2)
        ],
      )),
    );
  }
}
