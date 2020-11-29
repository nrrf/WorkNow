import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';

class AuthenticationProvider with ChangeNotifier {
  bool _autenticado = false; 

  get getIsAuthenticated => this._autenticado;
}