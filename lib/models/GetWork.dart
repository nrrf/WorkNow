import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:expandable/expandable.dart';

class GetWork extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    
    FirebaseFirestore.instance
    .collection('users')
    .get()
    .then((QuerySnapshot querySnapshot) => {
        querySnapshot.docs.forEach((doc) {
          return 
            Card1(doc["cargo"],doc["empresa"],doc["descripcion"],doc["conocimientos"],doc["jornada"],doc["salario"]);
        })
    });

  }

  
}



class Card1 extends StatelessWidget {
  final String cargo;
  final String empresa;
  final String descripcion;
  final String conocimientos;
  final String jornada;
  final String salario;
  Card1(this.cargo, this.empresa, this.descripcion, this.conocimientos,
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
                              descripcion +
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
