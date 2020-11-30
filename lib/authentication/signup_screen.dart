import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:worknow/home/works_screen.dart';
import 'package:provider/provider.dart';
import 'package:worknow/home/tab_screen.dart';
import 'package:worknow/models/user.dart' as myUser;

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup-screen';
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Image.asset('assets/splash/HeaderReg.png',
                width: MediaQuery.of(context).size.width * 0.5)
          ]), // imagen de inicio
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Theme.of(context).primaryColor,
              ),
              padding: EdgeInsets.only(top: 20, left: 30, right: 20),
              child: Column(children: <Widget>[
                SignUpForm(),
              ]))
        ])));
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpForm> {
  TextEditingController name = TextEditingController();
  TextEditingController cedula = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: name,
                    cursorColor: Theme.of(context).primaryColor,
                    cursorWidth: 4,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Nombre Completo',
                      suffixIcon: Icon(Icons.person,
                          color: Theme.of(context).primaryColor),
                      hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ])),
        SizedBox(height: 20),
        Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: cedula,
                    cursorColor: Theme.of(context).primaryColor,
                    cursorWidth: 4,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Cedula',
                      suffixIcon: Icon(Icons.portrait,
                          color: Theme.of(context).primaryColor),
                      hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ])),
        SizedBox(height: 20),
        Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: email,
                    cursorColor: Theme.of(context).primaryColor,
                    cursorWidth: 4,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Correo',
                      suffixIcon: Icon(Icons.mail,
                          color: Theme.of(context).primaryColor),
                      hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ])),
        SizedBox(height: 20),
        Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: password,
                    obscureText: true,
                    cursorColor: Theme.of(context).primaryColor,
                    cursorWidth: 4,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Contraseña',
                      suffixIcon: Icon(Icons.vpn_key,
                          color: Theme.of(context).primaryColor),
                      hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ])),
        SizedBox(height: 20),
        Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: repassword,
                    obscureText: true,
                    cursorColor: Theme.of(context).primaryColor,
                    cursorWidth: 4,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Repetir Contraseña',
                      suffixIcon: Icon(Icons.vpn_key,
                          color: Theme.of(context).primaryColor),
                      hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ])),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          alignment: Alignment.centerLeft,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              color: Theme.of(context).accentColor,
              child: Text('Registrarse',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email.text, password: password.text);
                  myUser.User user = new myUser.User(
                      name.text, email.text, cedula.text, password.text);
                      user.addUser();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TabsScreen()));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
