import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  String id; 
  String displayName;
  String email; 
  String cedula;

  User({
    this.id,
    this.displayName, 
    this.email, 
    this.cedula
  });

  factory User.fromFirestore(DocumentSnapshot userDoc){
      Map userData = userDoc.data(); 

    return User(
      id: userDoc.id,
      displayName: userData['displayName'],
      email: userData['email'],
      cedula: userData['cedula']
    );
  }

  // cuando hay cambios en la base de datos (y se actualiza en la app)

  void setFromFireStore(DocumentSnapshot userDoc){
    Map userData = userDoc.data();  

    this.id = userDoc.documentID; 
    this.displayName = userData['displayName']; 
    this.email = userData['email']; 
    this.cedula = userData['cedula'];
    notifyListeners();
  }

}