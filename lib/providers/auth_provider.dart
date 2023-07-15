import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/api/cafe_api.dart';
import 'package:flutter_admin_dashboard/models/http/auth_response.dart';
import 'package:flutter_admin_dashboard/router/router.dart';
import 'package:flutter_admin_dashboard/services/local_storage.dart';
import 'package:flutter_admin_dashboard/services/navigation_service.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

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
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  register(String email, String password, String fullName) {
    final data = {'nombre': fullName, 'correo': email, 'password': password};

    CafeApi.httpPost('/usuarios', data).then((json) {
      print(json);
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;
      // navegar al dashboard
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      //LocalStorage.prefs.getString('token');
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      notifyListeners();
    }).catchError((e) {
      print('Error en: $e');
      //TODO Mostrar notificacion de error
    });


  }

  Future<bool> isAuthenticated() async {
    // no esta autenticado
    final token = LocalStorage.prefs.getString('token');

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
    notifyListeners();
    return true;
  }
}
