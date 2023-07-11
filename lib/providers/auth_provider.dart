import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/services/local_storage.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    // Todo peticion http
    _token = 'asasasasasaasdwwesdsdasdfgasg';
    LocalStorage.prefs.setString('token', _token!);
    LocalStorage.prefs.getString('token');

    // navegar al dashboard
    authStatus = AuthStatus.authenticated;
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    // no esta autenticado
    final token = LocalStorage.prefs.get('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    // esta autenticado
    // TODO ir al backend y comprobar si el JWT es valido

    //simulamos autenticacion
    await Future.delayed(const Duration(seconds: 1));
    authStatus = AuthStatus.authenticated;
    return true;
  }
}
