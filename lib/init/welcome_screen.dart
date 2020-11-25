import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worknow/authentication/login_screen.dart';
import 'package:worknow/authentication/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/welcome-screen';
  WelcomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final String button1 = "Ingreso";
  final String button2 = "Registro";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: _body(),
    );
  }

  Widget _body() {
    // este codigo nos dice en que rotacion esta el dispositivo movil
    /* 
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var mywidth;
    if (isPortrait == true) {
      mywidth = MediaQuery.of(context).size.width;
    } else {
      mywidth = MediaQuery.of(context).size.height;
    }
    
    print('$isPortrait');
    */
    return SafeArea(
        // safe area nos asegura q no nos vamos a chocar con la parte de notificaciones
        child: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        Image.asset('assets/splash/wave.png',
            width: MediaQuery.of(context).size.width),
        Image.asset('assets/splash/company.png', width: 75),
        SvgPicture.asset('assets/splash/contract.svg', width: 150, height: 200),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: 'Conectemonos...',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        _button(button1),
        SizedBox(
          height: 20,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: 'No tienes cuenta...',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        _button(button2),
      ],
    )));
  }

  Widget _button(mensaje) {
    return GestureDetector(
      onTap: () {
        if (mensaje == "Ingreso") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
        else{
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        margin: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              mensaje,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
