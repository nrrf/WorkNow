import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InformationScreen extends StatefulWidget {
  static const String routeName = '/information-screen';
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final String name = "Nombre Completo: ";
  final String myName = "Camilo Fajardo Reyes";
  final String cc = "Cedula: ";
  final String myCc = "1.019.303.777";
  final String email = "Correo electronico: ";
  final String myEmail = "cfajar@gmail.com";
  final String password = "Contraseña: ";
  final String myPassword = "***********************";
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
            SvgPicture.asset('assets/icons/tools.svg', width: 150, height: 150),
          ]),
          SizedBox(
            height: 20,
          ),
          _detalle(name, myName),
          SizedBox(
            height: 20,
          ),
          _detalle(cc, myCc),
          SizedBox(
            height: 20,
          ),
          _detalle2(email, myEmail),
          SizedBox(
            height: 20,
          ),
          _detalle2(password, myPassword),
        ],
      )),
    );
  }

  Widget _detalle(mensaje, my) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
      margin: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        mensaje,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        my,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      )
                    ]),
              ])
        ],
      ),
    );
  }

  Widget _detalle2(mensaje, my) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
      margin: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              mensaje,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Modificar',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]),
                      RichText(
                        text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: my,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              )
                            ]),
                      ),
                    ]),
              ])
        ],
      ),
    );
  }
}
