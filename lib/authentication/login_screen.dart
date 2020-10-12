import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      Image.asset('assets/splash/HeaderIng.png',
          width: MediaQuery.of(context).size.width * 0.8)
    ])));
  }
}
