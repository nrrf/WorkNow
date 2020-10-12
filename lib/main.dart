import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:worknow/colors/the_magenta.dart';
import 'package:worknow/colors/the_blue.dart';
import 'package:worknow/home/tab_screen.dart';
import 'package:worknow/home/works_screen.dart';
import 'package:worknow/init/splash_screen.dart';
import 'package:worknow/init/welcome_screen.dart';
import 'package:worknow/authentication/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkNow',
      theme: ThemeData(
        primarySwatch: theMagenta,
        accentColor: theBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String button1 = "Buscar Empleo";
  final String button2 = "Empleos Aceptados";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        child: BottomNavigationBar(
          /*onTap: ,
            currentIndex: ,*/
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
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/file.svg',
                  width: 50, height: 50),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/tools.svg',
                  width: 50, height: 50),
              title: Text(''),
            ),
          ],
        ),
      ),

      /*bottomNavigationBar: BottomAppBar(
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () {
                
              },
              child: SvgPicture.asset('assets/icons/briefcase.svg',
              width: 50, 
              height: 50
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: SvgPicture.asset('assets/icons/file.svg',
              width: 50, 
              height: 50
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: SvgPicture.asset('assets/icons/tools.svg',
              width: 50, 
              height: 50)
            )
          ],
        )
      )*/

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
            SvgPicture.asset('assets/icons/briefcase.svg',
                width: 150, height: 150),
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
          _button(button1),
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
          _button(button2)
        ],
      )),
    );
  }

  Widget _button(mensaje) {
    return InkWell(
      onTap: () {},
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
