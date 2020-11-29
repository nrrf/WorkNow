import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; 

import 'package:worknow/models/user.dart' as miusuario;
enum AuthStatus{
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated
}

// para tener en cuenta el User va a hacer referencia al de Firebase y el miusuario.User si al de models.user.dart

class AuthService with ChangeNotifier{
  final FirebaseAuth _auth; 
  miusuario.User _user = new miusuario.User();

  final FirebaseFirestore _db = FirebaseFirestore.instance; 
  AuthStatus _status = AuthStatus.Uninitialized;

  AuthService.instance() : _auth = FirebaseAuth.instance{
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> _onAuthStateChanged(User firebaseUser) async {
    if(firebaseUser == null){
      _status = AuthStatus.Unauthenticated;

    }else{
      DocumentSnapshot userSnap = await _db 
      .collection('users')
      .doc(firebaseUser.uid)
      .get();

      _user.setFromFireStore(userSnap); 
      _status = AuthStatus.Authenticated;
    }

  }

  // para actualizar en la base de datos los cambios que hayamos hecho en la app

  Future<DocumentSnapshot> updateUserData(User user) async{
    DocumentReference userRef = _db
    .collection('users')
    .doc(user.uid);

    userRef.set({
      'uid' : user.uid,
      'email': user.email,
      'lastSign': DateTime.now(),
      'cedula': user.photoURL,
      'displayName': user.displayName,
    }, SetOptions(merge: true));

    // vamos a obtener ese doc q hemos retornado 

    DocumentSnapshot userData = await userRef.get(); 
    return userData;
  }

  // para cuando se sale
  void signOut(){
    _auth.signOut(); 
    _status = AuthStatus.Unauthenticated; 
    notifyListeners();
  }

  AuthStatus get status => _status;
  miusuario.User get user => _user; 

}