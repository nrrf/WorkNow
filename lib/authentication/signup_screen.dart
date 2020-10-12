import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            child: Column(children: <Widget>[
      // imagen de inicio
      Image.asset('assets/splash/HeaderReg.png',
          width: MediaQuery.of(context).size.width * 0.8)
    ])));
  }
}
