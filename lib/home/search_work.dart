import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worknow/home/information_screen.dart';
import 'package:expandable/expandable.dart';
import 'dart:math' as math;

class SearchWorkScreen extends StatefulWidget {
  @override
  _SearchWorkState createState() => _SearchWorkState();
}

class _SearchWorkState extends State<SearchWorkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            for (var _ in Iterable.generate(
                5)) // Muy interesante, hace 5 veces Card1()
              Card1(),
          ],
        ),
      ),
    );
  }
}

const cargo = "Desarrollador Web";
const empresa = "Asertempo";
const detalles =
    "Importante empresa esta en búsqueda de estudiantes o profesionales en ingeniería de sistemas ,telecomunicaciones,electrónica o a fines con experiencia mínima de 2 años como desarrollador web";
const conocimientos = "Conocimientos :JAVA,WEB,API,WEB SERVICE,SQL";
const jornada = "Jornada: Completa";
const salario = "2000000 - 2500000";

class Card1 extends StatelessWidget {
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
                      style: Theme.of(context).textTheme.body2,
                    )),
                collapsed: Text(
                  empresa,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
                        )),
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
