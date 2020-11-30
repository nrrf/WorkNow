import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class User{
  final String fullName;
  final String email;
  final String cedula;
  final String password;

  
  User(this.fullName, this.email, this.cedula, this.password);
    Future<void> addUser() {
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'full_name': fullName, 
            'email': email, 
            'cedula': cedula,
            'password': password 
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }



    /*
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
  */
}
