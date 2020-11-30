import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worknow/home/information_screen.dart';
import 'package:worknow/models/GetWork.dart';
import 'package:expandable/expandable.dart';
import 'dart:math' as math;

class SearchWorkScreen extends StatefulWidget {
  static const String routeName = '/search-work-screen';
  @override
  _SearchWorkState createState() => _SearchWorkState();
}

class _SearchWorkState extends State<SearchWorkScreen> {
  String cargo = "Desarrollador Web";
  String empresa = "Asertempo";
  String detalles =
      "Importante empresa esta en búsqueda de estudiantes o profesionales en ingeniería de sistemas ,telecomunicaciones,electrónica o a fines con experiencia mínima de 2 años como desarrollador web";
  String conocimientos = "Conocimientos :JAVA,WEB,API,WEB SERVICE,SQL";
  String jornada = "Jornada: Completa";
  String salario = "2000000 - 2500000";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: _body(),
    );
  }

  Widget _body() {
    CollectionReference works = FirebaseFirestore.instance.collection('works');
    return SafeArea(
      child: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'Estos son los empleos con\ndisponibilidad Actual',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
              ]),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: works.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return new Column(
                  children:
                      snapshot.data.docs.map((DocumentSnapshot document) {
                    return new 
                      Card1(document.data()["Cargo"].toString(),document.data()["Empresa"].toString(),document.data()["Descripcion"].toString(),document.data()["Conocimiento"].toString(),document.data()["Jornada"].toString(),document.data()["Salario"].toString()
                    );
                  }).toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  final String cargo;
  final String empresa;
  final String detalles;
  final String conocimientos;
  final String jornada;
  final String salario;
  Card1(this.cargo, this.empresa, this.detalles, this.conocimientos,
      this.jornada, this.salario);
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      cargo,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
                collapsed: Text(
                  empresa,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          empresa +
                              "\n\n" +
                              detalles +
                              "\n\n" +
                              conocimientos +
                              "\n\n" +
                              jornada +
                              "\n\n" +
                              salario,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        )),
                    Container(
                        child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RichText(
                                text: TextSpan(
                              text: 'Solicitar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            )),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
